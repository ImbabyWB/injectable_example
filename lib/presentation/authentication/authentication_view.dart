import 'package:flutter/material.dart';
import 'package:task_1/core/adsa.dart';
import 'package:task_1/core/injection.config.dart';
import 'package:task_1/core/injection.dart';
import 'package:task_1/presentation/authentication/bloc/auth_bloc.dart';
import 'package:task_1/presentation/ui/home_screen.dart';

class AuthenticationScreen extends StatelessWidget {
   AuthenticationScreen({Key? key}) : super(key: key);
  AuthBloc authBloc = getIt.get<AuthBloc>();
  BackendService backendService = getIt.get<BackendService>(param1: "www.google.com");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(),
          TextFormField(),
          const SizedBox(height: 50,),
          Container(color: Colors.white,
          child: InkWell(
              onTap: (){
              },
              child: ElevatedButton(
                  onPressed: () {
                    authBloc.login("username", "pass");
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomeScreen()));
                  },
                  child: const Text("Hello"))),
          ),
        ],
      ),
    );
  }
}
