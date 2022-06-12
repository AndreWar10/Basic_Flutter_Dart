class PostModel { //Representa nosso objeto mockado
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel(this.userId, this.id, this.title, this.body);

//new constructor (sabe construir um obj PostModel a partir de um Mapa)
  factory PostModel.fromJson(Map json) {
    return PostModel(json['userId'],json['id'],json['title'],json['body']);
  }

  @override
  String toString() {
    return "id: $id"; 
  }

}

