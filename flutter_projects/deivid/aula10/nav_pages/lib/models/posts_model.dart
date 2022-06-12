//Posts é o nome da API
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  //factory => tipo novo de construtor que fabrica um objeto
  factory Post.fromJson(Map json) {
    return Post(json['userId'], json['id'], json['title'],
        json['body']); //esse cara representa o objeto
  }

  @override
  String toString() {
    return 'id: $id';
  }
}
