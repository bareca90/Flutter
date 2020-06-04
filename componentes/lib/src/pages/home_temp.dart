import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones =['Uno','Dos','Tres','Cuatro','Cinco','Seis','Siete','Ocho','Nueve','Diez'];




  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
        body: ListView(
          //children: _crearitems()
          children: _crearItemsCorto()
        ),
      ),
    );
  }

  List<Widget> _crearitems(){
    List<Widget> lista = new List<Widget>();
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)
            ..add(Divider());
      
    }

    

    return lista;
  }
  List<Widget> _crearItemsCorto(){
    return opciones.map(( item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item+'!'),
            subtitle: Text('Descripcion'),
            leading: Icon(Icons.laptop),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );    

    }).toList();
  
  
   
  
  }
}