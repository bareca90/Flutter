import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/pages/home_page.dart';
import 'package:preferenciausuarioapp/src/pages/settings_page.dart';
import 'package:preferenciausuarioapp/src/share_prefs/preferencias_usuario.dart';
 
void main()async {
  //aqui se inicializan las preferencias de usuario 
   WidgetsFlutterBinding.ensureInitialized();
   final prefs = new PreferenciasUsuarios();
   await prefs.initPrefs();
   runApp(MyApp());
}
  
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuarios();
    return MaterialApp(
      title: 'Preferencias',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routename : (BuildContext context )=> HomePage(),
        SettingsPage.routename : (BuildContext context )=> SettingsPage(),
      },
    );
  }
}