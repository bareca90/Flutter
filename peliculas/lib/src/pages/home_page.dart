import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';
class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){
              //boton de busqueda
               showSearch(
                 context: context, 
                 delegate: DataSearch(),
                 //query: 'Hola',
               ); 
            },

          ),  

        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swipperTarjetas(),
            _footer(context)
          ],
        ),
      ),
      
    );
  }

  Widget _swipperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEncines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData){
          return CardSwiper(
            peliculas: snapshot.data,
          );
        }else{
          return Container(
              height: 200.0,
              child: Center(
                child: CircularProgressIndicator(

                )
              )
          );
        }
        
        
        
      },
    );
    /*
    
    return CardSwiper(
      peliculas: [1,2,3,4,5],
    );
    */
  }

  Widget _footer(BuildContext context) {


    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Populares',style: Theme.of(context).textTheme.subhead)
          ),
          SizedBox(height: 5.0,),

          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            
            builder: (BuildContext context,AsyncSnapshot<List> snapshot){
              if (snapshot.hasData){
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPopulares,
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }

              //snapshot.data?.forEach((p)=>print(p.title));
              //return Container();
            },
          ),
          
        ],
      ),
    );

  }
}