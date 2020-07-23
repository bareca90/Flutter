import 'package:flutter/material.dart';
import 'package:noticias/src/models/category_model.dart';
import 'package:noticias/src/services/news_services.dart';
import 'package:noticias/src/theme/tema.dart';
import 'package:noticias/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListaCategoria(),
            Expanded(
                child: ListaNoticias(
                    newsServices.getArticulosCategoriaSeleccionada))
          ],
        ),
      ),
    );
  }
}

class _ListaCategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewsServices>(context).categorias;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categorias.length,
          itemBuilder: (BuildContext context, int index) {
            final cnombre = categorias[index].nombre;

            return Container(
              // width: 110,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    _CategoryButton(
                      categoria: categorias[index],
                    ),
                    SizedBox(height: 5),
                    Text('${cnombre[0].toUpperCase()}${cnombre.substring(1)}')
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;
  const _CategoryButton({this.categoria});

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);
    return GestureDetector(
      onTap: () {
        final newsServices = Provider.of<NewsServices>(context, listen: false);
        newsServices.categoriaSeleccionada = categoria.nombre;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icono,
          color: (newsServices.categoriaSeleccionada == this.categoria.nombre)
              ? mitema.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
