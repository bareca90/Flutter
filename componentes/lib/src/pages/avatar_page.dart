import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Pagina de Avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://culto.latercera.com/wp-content/uploads/2018/11/Stan-Lee.jpg'),  
              radius: 25.0,
            ),
          ),    


          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
              
            ),
          )

        ],
      ) ,
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/original.gif'), 
          image: NetworkImage('https://nomecensures.com/wp-content/uploads/2018/11/stanlee-1-1280x720.jpg'),
          fadeInDuration: Duration(milliseconds: 300),
        ),
      ),

    );
  }
}