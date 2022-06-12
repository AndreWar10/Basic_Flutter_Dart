import 'dart:convert';
//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nav_pages/controllers/posts_controller.dart';
import 'package:nav_pages/widgets/custom_button_widget.dart';

//import 'package:nav_pages/two_page.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  //acesso ao controller
  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([
                _controller.posts,
                _controller.inLoader
              ]), //variavel observada
              builder: (_, __) => _controller.inLoader.value
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), //desabilitamos o scroll da list
                      shrinkWrap: true, //tamanho ocupar asó a qtd da lista
                      itemCount: _controller
                          .posts.value.length, //pegar tamanho da lista
                      itemBuilder: (_, idx) => ListTile(
                            //idx do index
                            title: Text(_controller.posts.value[idx].title),
                          )),
            ),
            SizedBox(height: 10),
            CustomButtonWidget(
              // disable: false,
              onPressed: () => _controller.callAPI(),
              title: 'Custom BTN',
              titleSize: 18,
            ),
          ],
        ),
      )),
    );
  }
}
