

//import 'dart:html';

//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/productos_bloc.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';

import 'package:formvalidation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';
class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  ProductoBloc productosBloc ; 
  ProductoModel producto = new ProductoModel();
  //final productoProvider = new  ProductosProvider();

  bool _guardando = false; 
  
  final ImagePicker _picker = ImagePicker();
  PickedFile foto; 

  
  @override
  Widget build(BuildContext context) {
    productosBloc = Provider.productosBloc(context);

    //de esta manera recibo los argumentos enviados desde la pagina que se invoca
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if( prodData != null) {
      producto = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          //Boton de seleccionar foto
          IconButton(
            icon: Icon(Icons.photo_size_select_actual), 
            onPressed:_seleccionarFoto
          ),
          //boton de tomar foto
          IconButton(
            icon: Icon(Icons.camera_alt), 
            onPressed: _tomarFoto
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey ,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crarBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',

      ),
      onSaved:(value)=> producto.titulo=value  ,
      validator:(value){
        if(value.length <3 ){
          return 'Ingrese el nombre de un producto';
        }else{
          return null;
        }
      } ,
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
        
      ),
      onSaved:(value)=> producto.valor=double.parse(value)  ,
      validator: (value){
        if(utils.isNumeric(value)){
          return null;
        }else{
          return 'Solo Numeros';
        }
      },
    );
  }

  Widget _crarBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      label : Text('Guardar'),
      icon: Icon(Icons.save),
      textColor: Colors.white,
      color: Colors.deepPurple,
      onPressed:(_guardando)? null : _submit
    );
  }

  void _submit () async {
    //! negacion
    if ( !formKey.currentState.validate()) {
      return ;
    }
    formKey.currentState.save();
        
    setState(() {
      _guardando = true;   
    });


    //Con este codigo guardo el path de la imagen 
    
    if(foto != null){
      producto.fotoUrl= await  productosBloc.subirFoto(foto);
    }
    


    if(producto.id==null){
      productosBloc.agregarProductos(producto);
      //productoProvider.creatProducto(producto);
    }else{
      productosBloc.editarProductos(producto);
      //productoProvider.editarProducto(producto);
    }

    //setState(() {   _guardando = false;      });

    //mensaje parte inferios
    mostrarSnackBar('Registro Guardado Exitosamente !!');
    Navigator.pop(context);

  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible, 
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=>setState((){
        producto.disponible = value;
      })
    ); 
  }

  void mostrarSnackBar(String mensaje){
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),

    );
    scaffoldKey.currentState.showSnackBar(snackbar);

  }

  Widget _mostrarFoto(){
    if (producto.fotoUrl != null) {
 
      return FadeInImage(
        placeholder: AssetImage('assets/loading.gif'), 
        image: NetworkImage(producto.fotoUrl),
        height: 300.0,
        fit: BoxFit.contain,
      );
 
    } else {
 
      if( foto != null ){
        return Image.file(
          File(foto.path),
                 //File(foto.path)
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/image.png');
    }
  }
  _seleccionarFoto() async {
    
      _procesarImagen(ImageSource.gallery);
      
  }

  void _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  
  }

  _procesarImagen(ImageSource origen)async {
    foto = await _picker.getImage(
       source: origen
      );
      if(foto != null ){
        producto.fotoUrl = null;
      }
      setState(() {
        
      });
  }

}