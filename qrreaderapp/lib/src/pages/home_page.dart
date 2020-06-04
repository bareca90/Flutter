import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0 ;
  final scansbloc = new ScansBloc(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansbloc.borrarScanTODOS,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed:()=> _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _crearBottonNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex, //le dira que elemento es el que esta activo 
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones'),
        )
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch(paginaActual ){
      case 0 : return MapasPage();
      case 1 : return DireccionesPage();
      default : return MapasPage();
    }
  }

   _scanQR(BuildContext context) async {
     //https://www.fernando-herrera.com/#/home
     //geo:40.73359922990751,-73.53490248164066
    //var futureString ;

    
    var  futureString ;


    
    try{
      futureString = await  BarcodeScanner.scan();
      
    }catch(e){
      futureString = e.toString();

    }

    print('Future String: ${futureString.rawContent}');
    //if(futureString != null){
      //print('Tenemos Informacion');
      //print('Future String: ${futureString.rawContent}');
    //}
    
    if(futureString != null){
      
      final scan = ScanModel(valor: futureString.rawContent );
      scansbloc.agregarScan(scan);
      
      //final scan2 = ScanModel(valor: 'geo:40.73359922990751,-73.53490248164066' );
      //scansbloc.agregarScan(scan2);
      if(Platform.isIOS){
         Future.delayed(Duration(milliseconds: 750),(){
           utils.abrirScan(context,scan);
         }); 

      }else{
        utils.abrirScan(context,scan);    
      }
      
    }
     

    
  }
}