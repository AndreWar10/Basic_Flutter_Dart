import 'package:flutter/material.dart';

//Executa a aplicação
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //Build => Responsavel por desenhar e biuldar os nossos Widgets
  Widget build(BuildContext context) { 
    //Widget MaterialApp
    return MaterialApp( 
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      //Primeira página do App
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  //Aqui que populamos o parâmetro chamado na classe
  final String title;

  //Classe para o gerenciamento de estado
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

//void não retorna nada!
  void _incrementCounter() {
    //Mudar o estado da aplicação
    setState(() => _counter++ //Passamos o que queremos atualizar
    );
  }

  void _decrementCounter() {
      //Mudar o estado da aplicação
      setState(() => _counter-- //Passamos o que queremos atualizar
      );
  }

//Aqui que construimos a nossa aplicação:
  @override
  Widget build(BuildContext context) {
    //Corpo da Aplicação
    return Scaffold(
      //Primeiro filho
      appBar: AppBar(
        //Pega o Widge title
        title: Text(widget.title),
      ),

      //2º Corpo do App (verso da folha)
      body: Center(
        //Column aceita mais filhos
        child: Column(
         //Alinhados ao centro
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Quantas vezes vc apertou?',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      //Irmão da AppBar/body
      floatingActionButton: Column(
        //Descer os botões (CrossAxisAligment -> Horizontal e Main -> Vertical)
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
          onPressed: _incrementCounter, //o que acontece quando o usuário aperta o botão;
          tooltip: 'Increment!', //Texto quando passa a mão em cima
          child: const Icon(Icons.add),
        ),

          FloatingActionButton(
          onPressed: _decrementCounter, //o que acontece quando o usuário aperta o botão;
          tooltip: 'Decrement!', //Texto quando passa a mão em cima
          child: const Icon(Icons.minimize),
          backgroundColor: Colors.red,
        ),

      ]), 
    );
  }
}
