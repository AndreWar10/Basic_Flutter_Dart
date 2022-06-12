import 'package:flutter/material.dart';

class OnePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Container(
                height: 200,
                //MediaQuery pega o tamanho do dispositivo a partir de um contexto
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Center(
                  //Centraliza o texto
                  child: Text(
                    "Olá Mundo!!!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),

              //Alinhados horizontal
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 195,
                    child: Center(
                      child: Text("Container 1"),
                    ),
                  ),
                  Container(
                    color: Colors.pink,
                    height: 100,
                    width: 195,
                    child: Center(
                      child: Text("Container 2"),
                    ),
                  ),
                ],
              )
            ],
          );
  }
}