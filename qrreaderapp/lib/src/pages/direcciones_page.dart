import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class DireccionesPage extends StatelessWidget {
  final scansbloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    scansbloc.obtenerScans();
    return StreamBuilder<List<ScanModel>>(
      stream: scansbloc.scansStreamHttp,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),  
          );
        }
        final scan = snapshot.data;
        if (scan.length==0){
          return Center(
            child: Text('No Hay Informacion')
          );
        }

        return ListView.builder(
          itemCount: scan.length,
          itemBuilder: (context,i)=> Dismissible(

              child: ListTile(
              leading: Icon(Icons.cloud_queue,color: Theme.of(context).primaryColor),
              title: Text(scan[i].valor),
              subtitle: Text('Id : ${scan[i].id}'),
              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey),
              onTap: ()=> utils.abrirScan(context,scan[i]),
              //onTap: utils.abrirScan(scan[i]),
            ), 
            key: UniqueKey(),
            background: Container(
              color: Colors.grey,
            ),
            onDismissed:(direction)=>scansbloc.borrarScan(scan[i].id),
          ),
        );
        
      },
    );
  }
}