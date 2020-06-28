

//realiza las interacciones directas con la base de datos
import 'dart:convert';
//import 'dart:html';
import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http_parser/http_parser.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:mime_type/mime_type.dart';
class ProductosProvider {
  final String _url = 'https://flutter-varios-6da90.firebaseio.com'; //url de la raiz de la base de datos
  final _prefs = new PreferenciasUsuario();

  Future<bool> creatProducto (ProductoModel producto) async {
    final url = '$_url/productos.json?auth=${_prefs.token}';
    final response = await http.post(url,body: productoModelToJson(producto));
    final decodeData = json.decode(response.body);

    print(decodeData);

    return true ; 
  }

  Future<bool> editarProducto (ProductoModel producto) async {
    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';
    final response = await http.put(url,body: productoModelToJson(producto));
    final decodeData = json.decode(response.body);

    print(decodeData);

    return true ; 
  }

  Future<List<ProductoModel>>  cargarProductos () async {
    final url = '$_url/productos.json?auth=${_prefs.token}';
    final respuesta = await http.get(url) ;
    final Map<String,dynamic> decodeData = json.decode(respuesta.body);
    final List<ProductoModel> productos = new List();
    if ( decodeData == null ) return [];
    if (decodeData['error']!=null ) return [];
    
    decodeData.forEach((id,prod){
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;

      productos.add(prodTemp);
    });
    //print(productos);
    return productos;

  }

  Future<int> borrarProducto(String id)async {

    final url= '$_url/productos/$id.json?auth=${_prefs.token}';
    final respuesta = await http.delete(url);


    return 1;
  }
  
  Future<String> subirImagen(PickedFile imagen  )async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/daenysooa/image/upload?upload_preset=pyvwe7qt');
    final mimeType = mime(imagen.path).split('/');
    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType(mimeType[0],mimeType[1])
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await  http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode !=201 ){
      print ('algo salio mal');
      print (resp.body);
      return null;
    }
    //si todo se hizo bien
    final respData = json.decode(resp.body);
    print(respData);
    
    return respData['secure_url'];
  
  }
  

}