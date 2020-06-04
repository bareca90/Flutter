import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollCOntroller = new ScrollController();

  List<int> _listaNumeros = new List() ;
  int _ultimoItem = 0;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollCOntroller.addListener((){
      //con esta condicion consulto si llego al final de la pagina
      if(_scrollCOntroller.position.pixels==_scrollCOntroller.position.maxScrollExtent){
         //_agregar10();
         fetchData();
      }
    }
    );
  }
  //con este metodo se deseccha los widgets que se crean una y otra vez
  @override
  void dispose() {
    super.dispose();
    _scrollCOntroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ),
      
      
      
    );
    
  }

  Widget _crearLista(){

    return RefreshIndicator(
            onRefresh: obtenerPagina1 ,
            child: ListView.builder(
            itemBuilder: (BuildContext context,int index){
            final imagen = _listaNumeros[index];
            return FadeInImage(
              placeholder: AssetImage('assets/original.gif'), 
              image: NetworkImage('https://picsum.photos/500/500/?image=$imagen')
            );
          },
          itemCount: _listaNumeros.length,
          controller: _scrollCOntroller,

      ),
    );
  }
  Future<Null> obtenerPagina1() async{

    final duration = new Duration(seconds:2);
    new Timer(duration,(){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10(){
    for (var i = 1;i < 10;i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }

  Future<Null> fetchData() async{
    _isLoading=true;
    setState(() { });
    final duration = new Duration(seconds:2);
    new Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading=false;
    _scrollCOntroller.animateTo(
      _scrollCOntroller.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: new Duration(milliseconds: 250)
      //offset, duration: null, curve: null
    );
    _agregar10();
  }

  Widget  _crearLoading() {
    if (_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
            
          ),
          SizedBox(height:15.0)
        ],
      );
      
      
      
    }else{
      return Container();
    }
  }


  
}

