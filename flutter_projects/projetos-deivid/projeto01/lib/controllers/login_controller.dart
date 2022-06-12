import 'package:flutter/cupertino.dart';

class LoginController {

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  //Atribuir o que o usuario digitar ao _login
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;



//autenticação
  Future<bool> auth() async{
    //print('login: $_login, pass: $_pass');
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;

    return _login == 'admin' && _pass == '123';
  
  }
}