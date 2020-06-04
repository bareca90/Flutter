import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
     static final String routename ='home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
      ),
      drawer: _crearMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario'),
          Divider(),
          Text('Genero'),
          Divider(),
          Text('Nombre Usuario'),
          Divider(),
        ],
      ),
    );
  }

  Drawer _crearMenu() {
    return Drawer();
  }
}