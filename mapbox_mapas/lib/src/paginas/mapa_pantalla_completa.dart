import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class PantallaCompeltaMapa extends StatefulWidget {
  @override
  _PantallaCompeltaMapaState createState() => _PantallaCompeltaMapaState();
}

class _PantallaCompeltaMapaState extends State<PantallaCompeltaMapa> {
  MapboxMapController mapController;
  final center = LatLng(-2.141852, -79.619857);
  final mapaOscuro = 'mapbox://styles/bareca90/ckcy9knmh125v1irltvy7x94t';
  final mapaClaro = 'mapbox://styles/bareca90/ckcy9q4hr1ml11ipu9rmlf8eb';
  String estiloSeleccionado =
      'mapbox://styles/bareca90/ckcy9knmh125v1irltvy7x94t';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //Simbolos
        FloatingActionButton(
          child: Icon(Icons.sentiment_very_dissatisfied),
          onPressed: () {
            mapController.addSymbol(SymbolOptions(
                geometry: center,
                iconSize: 4,
                iconImage: 'attraction-15',
                textField: 'Lugar Creado aqui',
                textOffset: Offset(0, 2),
                textColor: '#cccccc'));
          },
        ),
        SizedBox(
          height: 5,
        ),
        //Zoom In
        FloatingActionButton(
            child: Icon(Icons.zoom_in),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomIn());
            }),
        SizedBox(
          height: 5,
        ),
        //Zoom Out
        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
        ),
        SizedBox(
          height: 5,
        ),
        //Cambiar Estilo
        FloatingActionButton(
            child: Icon(Icons.add_to_home_screen),
            onPressed: () => {
                  if (estiloSeleccionado == mapaOscuro)
                    {estiloSeleccionado = mapaClaro}
                  else
                    {estiloSeleccionado = mapaOscuro},
                  setState(() {})
                })
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
        styleString: estiloSeleccionado,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 14));
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }
}
