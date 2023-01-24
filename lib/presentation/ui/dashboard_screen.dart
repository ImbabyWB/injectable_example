import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_1/core/Styles/text_styles.dart';
import 'package:task_1/core/colors/colors.dart';
import 'package:task_1/core/injection.dart';
import 'package:task_1/core/spaces.dart';
import 'package:task_1/presentation/authentication/bloc/auth_bloc.dart';
import 'package:task_1/presentation/bloc/clinics_bloc.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
   ClinicsBloc clinicsBloc = getIt.get<ClinicsBloc>();

   @override
  Widget build(BuildContext context) {

     return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bigVSpace,
              bigVSpace,
              bigVSpace,
              Text("Change Price", style: mediumTextStyle.copyWith(color: mainColor),),
              smallVSpace,
              TextFormField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Price",
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade500,),borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade500,),borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: mainColor),borderRadius: BorderRadius.circular(8)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: mainColor,),borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:MaterialStateColor.resolveWith((states) {
                          return mainColor;
                        }),
                    ),
                      onPressed: (){
                      if(textEditingController.text.isNotEmpty)
                       {
                         clinicsBloc.changePrice(double.parse(textEditingController.text));
                         textEditingController.clear();
                         FocusScope.of(context).unfocus();
                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("price has been updated")));
                      }
                      }, child:  Text("Submit" , style: mediumTextStyle.copyWith(color: white),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
