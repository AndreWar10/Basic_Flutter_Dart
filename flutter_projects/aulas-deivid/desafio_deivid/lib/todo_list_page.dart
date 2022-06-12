import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            //Listar na tela
            Container(
              height: 400,  //tamanho que a lista ocupara na tela
              //child: ListView.builder(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),  //adiciona a linha para separar as task's
                itemCount: tarefas.length, //tamanho da lista
                itemBuilder: (context, index) { //recebe o tamanho da lista para printar 
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: () { //clica e segura
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    }, //espaço de tempo
                  );

              }),
            )
          ],
        )
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //botão de adicionar task
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              //Pelo menos um caracter digitado
              if(_textEditingController.text.length > 0) {
                setState(() { //importante para recriara a tela apos atualização
                  tarefas.add(_textEditingController.text);
                });//adiciona na lista
                _textEditingController.clear(); //limpa o campo para o usuario
              }

              print(tarefas);          
            },
            child: Icon(Icons.add),
          ),

          //botão para resetar lista
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
                setState(() { //importante para recriara a tela apos atualização
                  tarefas = []; //resetando lista
                });//adiciona na lista
                _textEditingController.clear(); //limpa o campo para o usuario
            },
            child: Icon(Icons.remove),
          ),

        ],
      ),
    );
  }
}