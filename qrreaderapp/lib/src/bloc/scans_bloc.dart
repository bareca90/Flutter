import 'dart:async';

import 'package:qrreaderapp/src/bloc/validators.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';
//patron block con stream
//se uso con los mixins para usar las propiedades de las validaciones
class ScansBloc with Validators{
  static final ScansBloc _singleton = new ScansBloc._internal();
  factory ScansBloc(){
    return _singleton;
  }

  ScansBloc._internal(){
    obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();
  Stream<List<ScanModel>> get scansStream => _scansController.stream.transform(validarGeo); //para geolocalizaciones
  Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validarHttp); //para direcciones web

  
  dispose(){
    _scansController?.close();
  }
  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }
  obtenerScans() async{
    _scansController.sink.add( await DBProvider.db.getTodosScan());

  }
  borrarScan(int id)async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScanTODOS() async {
    await DBProvider.db.deleteScanAll();
    obtenerScans();
  }


  
}