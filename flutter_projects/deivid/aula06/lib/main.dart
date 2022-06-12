import 'package:aula06/pages/home_page2.dart';
import 'package:flutter/material.dart';

//Deve ser sempre assim:
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Retirar o simbolo de Debug da tela do celular
      debugShowCheckedModeBanner: false,
      //Mudar a cor do tema do MaterialApp
      theme: ThemeData(
        primarySwatch: Colors.green, //Altera cor primaria
      ),
      home: HomePage2());
  }
}
