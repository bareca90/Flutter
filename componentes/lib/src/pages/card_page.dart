import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paginas de Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2() ,
          SizedBox(height: 30.0,),
          
        ],
      ),
    );
  }

  Widget _cardTipo1() {



    return Card(
      elevation: 20.0 ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album,color: Colors.blue,) ,
            title: Text('SOy el texto de esta Tarjeta'),
            subtitle: Text('Aqui estamos con la descripcion para que uds puedan ver los que estsamos haciendo donde este punto '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){

                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){
                  
                },
              )
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {

    final card =  Container(
      //para que la imagen siempre respete lo del contenedero de la tarjeta 
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://inspiringjourneys.com/assets/Uploads/Doubtful-Sound-shutterstock_344514380__FocusFillWzE2MDAsODIwLCJ4IiwxMjld.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration(
              milliseconds: 200
            ),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          
          /*
          Image(
            image: NetworkImage('https://inspiringjourneys.com/assets/Uploads/Doubtful-Sound-shutterstock_344514380__FocusFillWzE2MDAsODIwLCJ4IiwxMjld.jpg'),
          ),
          */
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner aqui'),
            
          )
        ],
      ),
    );
    return Container(
      
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),

    );
  }
}