



import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

class ProductoBloc {
  //creacion de los streams
  final _productosController = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _productosProvider = new ProductosProvider();

  //necesito escuchar los streams
  Stream<List<ProductoModel>>  get productoStream => _productosController.stream;
  Stream<bool>  get cargandoStream => _cargandoController.stream;


  void cargarProductos() async {
    final productos = await _productosProvider.cargarProductos();
    _productosController.sink.add(productos);


  }
  void agregarProductos(ProductoModel producto ) async{
    _cargandoController.sink.add(true);
    await _productosProvider.creatProducto(producto);
    _cargandoController.sink.add(false);



  }

  Future<String> subirFoto(PickedFile imagen ) async{
    _cargandoController.sink.add(true);
    final fotoUrl = await _productosProvider.subirImagen(imagen);
    _cargandoController.sink.add(false);

    return fotoUrl;


  }

  void editarProductos(ProductoModel producto ) async{
    _cargandoController.sink.add(true);
    await _productosProvider.editarProducto(producto);
    _cargandoController.sink.add(false);



  }

  void borrrarProductos(String  id ) async{
    await _productosProvider.borrarProducto(id);
    
  }

  dispose(){
    //cerrarlo si esta cargado
    _productosController?.close();
    _cargandoController?.close();
  }
}