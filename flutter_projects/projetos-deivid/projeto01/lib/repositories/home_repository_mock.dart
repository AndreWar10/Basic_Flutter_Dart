import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:projeto01/models/post_model.dart';
import 'package:projeto01/repositories/home_repository.dart';

//VAI LER OS JSONS DENTRO DE DATA
class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    //rootBundle vai identificar tudo que esta dentro de assets
    var value = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(value); //justamente a nossa lista em assets
    //e ~> cada objeto da nossa lista
    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }

}