import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
export 'package:qrreaderapp/src/models/scan_model.dart';
class DBProvider{
  static Database _database; 
  static final DBProvider db = DBProvider._(); //constructor privado 

  DBProvider._();
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path,'ScansDB.db');
    return await  openDatabase(
      path,
      version: 1, //son las versiones  esto es para cada cambio que se realiza
      onOpen: (db){},
      onCreate: ( Database db, int version ) async {
        await db.execute(
          'CREATE TABLE Scans('
          'id INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'valor TEXT'
          ')'
        );  


      }
    );
  }
  //Crear Registros de base de Datos
  //esto no se va a usar
  
  nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database ;
    final res = await db.rawInsert(
      "INSERT INTO Scans(id,tipo,valor) "
      "VALUES (${nuevoScan.id},'${nuevoScan.tipo}','${nuevoScan.valor})'"
    );

    return res;
  }

  //esta opcion se la va a usar
  nuevoScan(ScanModel nuevoScan ) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res ; 
  }

  //select - Obtener informacion 
  Future <ScanModel> getScanId (int id ) async {
    final db = await database ;
    final resp = await db.query('Scans',where :'id=?',whereArgs: [id]);
    return resp.isNotEmpty ? ScanModel.fromJson(resp.first) : null;

  }

  Future <List<ScanModel>> getTodosScan() async{
    final db = await database;
    final res = await db.query('Scans');
    List<ScanModel> list = res.isNotEmpty 
                              ? res.map((c)=> ScanModel.fromJson(c)).toList()
                              :[];
    return list;
  }

  Future <List<ScanModel>> getTodosScansPorTipo(String tipo) async{
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo='$tipo'");
    List<ScanModel> list = res.isNotEmpty 
                              ? res.map((c)=> ScanModel.fromJson(c)).toList()
                              :[];
    return list;
  }


  //actualizar registros 
  Future<int> updateScan(ScanModel nuevoScan)async {
      final db = await database;
      final res = await db.update('Scans', nuevoScan.toJson(), where: 'id=?',whereArgs: [nuevoScan.id]);

      return res;
  }
  //eliminar registros 
  Future<int> deleteScan(int id)async{
    final db = await database;
    final res = await db.delete('Scans',where : 'id=?',whereArgs: [id]);
    return res;
  }

  Future<int> deleteScanAll()async{
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }

}