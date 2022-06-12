import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../models/posts_model.dart';

import 'package:http/http.dart' as http;

class PostsController {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);


  // random() async {
  //   for (int i = 0; i < 10; i++) {
  //     await Future.delayed(Duration(seconds: 1));
  //     valorAleatorio.value = Random().nextInt(1000);
  //   }
  // }

  callAPI() async {
    var client = http.Client();
    try {
      inLoader.value = true;
      var response = await client.get(
        //Uri.https('example.com', 'whatsit/create'),
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse =
          jsonDecode(response.body) as List; //retorno tipado como lista
      //cada (e) reperesenta um objeto do nosso json
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList(); //map = mapeamento../interação e retornando um objeto de lista no final
      await Future.delayed(Duration(seconds: 2));

      //print(posts);
    } finally {
      client.close();
      inLoader.value = false;
    }
  }
}