import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    



    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),

      ),
      body: _crearListadoProductos(),
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

  Widget _crearListadoProductos() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData){
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length ,
            itemBuilder: (context,posicion) => _crearItem(context, productos[posicion]),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget  _crearItem(BuildContext context, ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction){
        // TODO : Borrar Prodcuto
        productosProvider.borrarProducto(producto.id);
      },
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