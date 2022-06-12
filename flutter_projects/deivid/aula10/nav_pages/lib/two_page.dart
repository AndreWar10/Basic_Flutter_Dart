import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  //Melhor forma de criar argumentos usando push(), é passando via construtor:
  //final String args;
  const TwoPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;//! confia que estamos passando rota
    return Scaffold(
      appBar: AppBar(), //garante a seta de retorno
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if(Navigator.of(context).canPop()) {  //verifica se tem retorno mesmo
              Navigator.of(context).pop('retorno');
            }
            
          },
          child: Text('Voltar para page anterior $args'),
        ),
      )
    );
  }
}