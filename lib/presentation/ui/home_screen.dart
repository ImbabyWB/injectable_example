import 'package:flutter/material.dart';
import 'package:task_1/core/colors/colors.dart';
import 'package:task_1/core/injection.dart';

import 'package:task_1/presentation/bloc/clinics_bloc.dart';
import 'package:task_1/presentation/bloc/clinics_state.dart';
import 'package:task_1/presentation/ui/dashboard_screen.dart';
import 'package:task_1/presentation/widgets/clinic_card.dart';
import 'package:task_1/presentation/widgets/header_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BehaviorSubject<int> pageIndex = BehaviorSubject();
   ClinicsBloc clinicsBloc  =  getIt.get<ClinicsBloc>();

  @override
  void initState() {
    pageIndex.sink.add(0);
    clinicsBloc.getAllClinics();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
        body:
         StreamBuilder<int>(
      stream: pageIndex.stream,
      builder: (context, snapshot) {
        if(pageIndex.value == 0 ) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const HeaderSection(),
                BlocBuilder<ClinicsBloc, ClinicsState>(
                    bloc: clinicsBloc,
                    builder: (context, state) {
                      if (state.states == ActionStates.loading ||
                          state.states == ActionStates.idle) {
                        return Center(
                          child: CircularProgressIndicator(color: mainColor,),
                        );
                      } else if (state.states == ActionStates.success) {
                        return SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .8,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 20, top: 20),
                            itemCount: state.clinics?.items?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ClinicCard(state.clinics!.items![index]);
                            },

                          ),
                        );
                      }
                      else {
                        return const Center(
                          child: Text("There is a problem will be fixed soon"),
                        );
                      }
                    }
                )

              ],
            ),
          );
      }
        else {
          return  DashboardScreen();
        }
      }
    ),
        bottomNavigationBar: StreamBuilder<int>(
      stream: pageIndex
        .stream,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          currentIndex: pageIndex.value,
           selectedItemColor: mainColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.local_hospital),label: "Clinics"),
            BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings),label: "Dashboard"),
          ],
          onTap: (index)async{
            pageIndex.sink.add(index);
          // print( await getIt.popScopesTill("Auth"));
           print( getIt.currentScopeName);
          clinicsBloc = getIt.get<ClinicsBloc>();
          },


        );
      }
    ),
    );
  }
}
