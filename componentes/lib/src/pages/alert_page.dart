import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Pagina de Alertas'),
      ) ,
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          shape: StadiumBorder(),
          textColor: Colors.white,
          onPressed:()=> _mostrarAlerta(context)
        ),
      ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.keyboard_backspace),
      onPressed:(){
        Navigator.pop(context);
      } ,
    ),
    );
  }
  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(size: 100.0)
                
              ],

            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: ()=> Navigator.of(context).pop(), 
              
              
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
              
              
              ),
            ],
          
        );
      }
    
    
    );
  }

}