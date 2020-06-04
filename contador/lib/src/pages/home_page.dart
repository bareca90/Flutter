import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  //declara estilos 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final estiloTexto = new TextStyle(fontSize: 30);
    final conteo =10;


    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true ,
        
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de Clicks',style: estiloTexto,),
            Text('$conteo',style: estiloTexto,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print('Hola Mundo');
        },  
      ),
      //floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
    );
  }


}
