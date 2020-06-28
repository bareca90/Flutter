import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
//import 'package:formvalidation/src/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),

      ),
      body: _crearListadoProductos(productosBloc),
      floatingActionButton: _crearBoton(context),
      
      /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email : ${bloc.email}'),
            Divider(),
            Text('Password : ${bloc.password}')
          ],
        ),
        */
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child : Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: ()=> Navigator.pushNamed(context, 'producto'),
    )  ;
  }

  Widget _crearListadoProductos(ProductoBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productoStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData){
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length ,
            itemBuilder: (context,posicion) => _crearItem(context, productos[posicion],productosBloc),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget  _crearItem(BuildContext context, ProductoModel producto,ProductoBloc productosBloc ) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction)=> productosBloc.borrrarProductos(producto.id),
      child: Card(
        child: Column(
          children: <Widget>[
            (producto.fotoUrl == null )
              ? Image(image: AssetImage('assets/image.png'))
              : FadeInImage(
                  image: NetworkImage(producto.fotoUrl),
                  placeholder: AssetImage('assets/loading.gif'), 
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text('${producto.titulo} - ${producto.valor}'),
                  subtitle: Text(producto.id),
                  onTap: () => Navigator.pushNamed(context, 'producto',arguments: producto),
                )
          ],
        ),
      ) ,
    );
  }


/*
  
    */



}