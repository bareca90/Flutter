import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciausuarioapp/src/widgets/menu_widget.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);
     static final String routename ='settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario ;
  int _genero ; 
  String _nombre = 'Pedro';
  TextEditingController _textController;
  final prefs = new PreferenciasUsuarios();
  @override
  void initState() { 
    super.initState();
    _genero=prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre=prefs.nombre;
    prefs.ultimaPagina= SettingsPage.routename;
    _textController = new TextEditingController(text: prefs.nombre);
    

  }
  
  _setSelectedRadio (int valor) {
    prefs.genero=valor;
    
    _genero = valor;
    setState(() { });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.colorSecundario)? Colors.teal : Colors.blue,
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
            value: _colorSecundario, 
            title: Text('Color Secundario'),
            onChanged: (value){
              
              setState(() {
                _colorSecundario=value;
                prefs.colorSecundario=value;
              });
            }
          ),
          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
            
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
            
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',


              ),
              onChanged: (value ){
                prefs.nombre=value;
              },
            ),
          )
        ],
      ),
    );
  }
}