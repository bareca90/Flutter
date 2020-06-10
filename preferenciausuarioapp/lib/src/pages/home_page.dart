import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciausuarioapp/src/widgets/menu_widget.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
     static final String routename ='home';
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuarios();
    prefs.ultimaPagina= HomePage.routename;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.colorSecundario)? Colors.teal : Colors.blue,
        title: Text('Preferencias de Usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario : ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero : ${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario : ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }

  
}