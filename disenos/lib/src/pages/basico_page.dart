import 'package:flutter/material.dart';
class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0,color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
      
    );
  }
  Widget _crearImagen(){
    return Container(
      width: double.infinity,
      child: Image(
              image: NetworkImage('https://i.ytimg.com/vi/BfCwN4iy6T8/maxresdefault.jpg'),
              height: 200.0,
              fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTitulo(){
    return SafeArea(
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Lago con un puente ',style: estiloTitulo,),
                  SizedBox(height: 7.0),
                  Text('Este lago en Espania',style: estiloSubtitulo,),
                ],
                
              ),
            ),
            Icon(Icons.star,color: Colors.red,size: 30.0,),
            Text('41',style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call,'CALL'),
        _accion(Icons.near_me,'ROUTE'),
        _accion(Icons.share,'Share'),

      ],
    );
  }

  Widget _accion(IconData icono,String texto){
    return Column(
      children: <Widget>[
        Icon(icono,color: Colors.blue,size: 40.0,),
        SizedBox(height: 6.0),
        Text(texto,style: TextStyle(fontSize: 15.0,color: Colors.blue))
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
        child: Text(
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}