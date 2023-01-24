import 'package:flutter/material.dart';
import 'package:task_1/core/injection.config.dart';
import 'package:task_1/core/injection.dart';
import 'package:task_1/presentation/authentication/authentication_view.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  configureDependencies();

  runApp(DevicePreview(
    enabled: false,
    builder: (context) {
      return const MyApp();
    }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: GestureDetector(
          onTap: ()=>FocusScope.of(context).unfocus(),
          child:  AuthenticationScreen()),
    );
  }
}
