import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:noticias/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(
          noticia: this.noticias[index],
          indice: index,
        );
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int indice;

  const _Noticia({@required this.noticia, @required this.indice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(
          noticia: noticia,
          indice: indice,
        ),
        _TarjetaTitulo(noticia: noticia, indice: indice),
        _TarjetaImagen(noticia: noticia),
        _TarjetaBody(noticia: noticia),
        _TarjetaBotones(),
        SizedBox(height: 10),
        Divider()
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
              onPressed: () {},
              fillColor: mitema.accentColor,
              child: Icon(Icons.star),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          SizedBox(width: 10),
          RawMaterialButton(
              onPressed: () {},
              fillColor: Colors.blue,
              child: Icon(Icons.more),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({this.noticia});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description != null ? noticia.description : ''),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage))
                : Image(image: AssetImage('assets/no-image.png'))),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  final int indice;

  const _TarjetaTitulo({this.noticia, this.indice});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(noticia.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)));
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int indice;
  const _TarjetaTopBar({this.noticia, this.indice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${indice + 1}.', style: TextStyle(color: mitema.accentColor)),
          Text('${noticia.source.name}.')
        ],
      ),
    );
  }
}
