import 'package:flutter/material.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion() ,
      
    );
  }
}

class _Navegacion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap:(i)=> print('$i'),
      items:[
        BottomNavigationBarItem(icon: Icon(Icons.person_outline),title: Text('Para Ti')),
        BottomNavigationBarItem(icon: Icon(Icons.public),title: Text('Encabezados')),

      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return PageView(
      /* physics: BouncingScrollPhysics(), */
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor ){
    this._paginaActual=valor ;
    notifyListeners();

  }


}