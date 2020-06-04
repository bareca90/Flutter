import 'package:contador/src/pages/contador_page_tabs.dart';
import 'package:flutter/material.dart';

//import 'package:contador/src/pages/home_page.dart';
//creacion de widget
class MyApp extends StatelessWidget{
  
  @override
  Widget build(context){



    return MaterialApp(
      debugShowCheckedModeBanner: false , //quita el banner por defecto 
      home: Center(
        //child: HomePage(),
        child: ContadorPage(),
      )
      ,
    );
  }

}