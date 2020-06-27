import 'dart:convert';

import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http; 

class UsuarioProvider {

  final String _firebaseToken ='AIzaSyAr2XcSzrY28krCE6Wab_dtTJ7TRpi4RNU';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String,dynamic>> login(String email,String password)async {
    final authData ={
      'email':email,
      'password' : password,
      'returnSecureToken' : true
    };
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode(authData)
    );

    Map<String,dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')){
      //sa;var e; token en el telefono 
      _prefs.token=decodedResp['idToken'];

      return {'ok':true,'token':decodedResp['idToken']};

    }else{

      //regresar un error 
      return {'ok':false,'mensaje':decodedResp['error']['message']};
    }
  }


  Future<Map<String,dynamic>> nuevoUsuario(String email,String password) async{
    final authData ={
      'email':email,
      'password' : password,
      'returnSecureToken' : true
    };
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode(authData)
    );

    Map<String,dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')){
      //sa;var e; token en el telefono 
      _prefs.token=decodedResp['idToken'];
      return {'ok':true,'token':decodedResp['idToken']};

    }else{

      //regresar un error 
      return {'ok':false,'mensaje':decodedResp['error']['message']};
    }


  }
}