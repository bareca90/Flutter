import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/widgets/menu_widget.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);
     static final String routename ='settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child:Text('Settings',style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold)) ,    
          ),
          Divider(),
          SwitchListTile(
            value: true, 
            title: Text('Color Secundario'),
            onChanged: (value){}
          ),
          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: 1, 
            onChanged: (value){}
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: 1, 
            onChanged: (value){}
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',

              ),
            ),
          )
        ],
      ),
    );
  }
}