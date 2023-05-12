import 'package:flutter/material.dart';
import 'package:hki_app/screen/login/login.dart';
import 'package:provider/provider.dart';
import 'package:hki_app/viewModel/adj_view_model.dart' as adj_logic;

void main() {
  runApp( MultiProvider(providers: 
    [
      ChangeNotifierProvider(create: (_)=> adj_logic.AdjLogic()),     
    ],
    child:const MyApp() ,
    ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}

