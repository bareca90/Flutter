import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), 
        //const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        
      ],
      
      initialRoute: '/',
      routes: getAppLocationRoutes(),
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (BuildContext context)=>AlertPage()
        );    

      },
    );
  }
}