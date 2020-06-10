

import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuarios{

  static final PreferenciasUsuarios _instancia = new PreferenciasUsuarios.internal();
  factory PreferenciasUsuarios(){
    return _instancia;
  }
  PreferenciasUsuarios.internal();
  SharedPreferences _prefs;
  initPrefs()async{
    _prefs = await SharedPreferences.getInstance();
  }

  get genero{
    return _prefs.getInt('genero')??1;
  }
  set genero(int value){
    _prefs.setInt('genero', value);

  }
  get nombre{
    return _prefs.getString('nombre')?? 'NNN';
  }
  set nombre(String value){
    _prefs.setString('nombre', value);
  }

  get colorSecundario{
    return _prefs.getBool('colorSecundario')?? false;
  }
  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }
  get ultimaPagina{
    return _prefs.getString('ultimaPagina')?? 'home';
  }
  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
  }
}