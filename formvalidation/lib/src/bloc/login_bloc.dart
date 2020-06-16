import 'dart:async';
import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {


  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //Recuperar los datos del Stream
  Stream<String>  get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String>  get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool>  get formValidStream => CombineLatestStream.combine2(emailStream, passwordStream,(e,p)=> true);
    
  //Stream<bool>   get  formValidStream=> CombineLatestStream. combine2(emailStream,  passwordStream,   (e,p)   ?>   true);

  //Insertar Valores al Stream
  Function(String ) get changedEmail => _emailController.sink.add;
  Function(String ) get changedPassword => _passwordController.sink.add;

  //obtener el ultimo valor ingresado en los streams 
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }



}