import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/src/models/category_model.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '88fef13edeb0483b991f25c2180f0871';

class NewsServices with ChangeNotifier {
  List<Article> headLines = [];
  String _categoriaSeleccionada = 'business';

  List<Category> categorias = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.futbol, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology')
  ];
  Map<String, List<Article>> categoryArticles = {};

  NewsServices() {
    this.getTopHeadLines();
    categorias.forEach((element) {
      this.categoryArticles[element.nombre] = new List();
    });
  }

  get categoriaSeleccionada => _categoriaSeleccionada;
  set categoriaSeleccionada(String valor) {
    this._categoriaSeleccionada = valor;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this.categoriaSeleccionada];

  getTopHeadLines() async {
    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY';
    final respuesta = await http.get(url);
    final newsResponse = newsResponseFromJson(respuesta.body);
    this.headLines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) {
      return this.categoryArticles[category];
    }
    final url =
        '$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY&category=$category';
    final respuesta = await http.get(url);
    final newsResponse = newsResponseFromJson(respuesta.body);
    this.categoryArticles[category].addAll(newsResponse.articles);
    notifyListeners();
  }
}
