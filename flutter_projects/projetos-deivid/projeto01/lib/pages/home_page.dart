import 'package:flutter/material.dart';
import 'package:projeto01/controllers/home_controller.dart';
import 'package:projeto01/models/post_model.dart';
import 'package:projeto01/repositories/home_repository_imp.dart';
import 'package:projeto01/services/prefs_service.dart';
//import 'package:projeto01/repositories/home_repository_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final HomeController _controller = HomeController(HomeRepositoryMock());
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [IconButton(onPressed: () {
            //botão de logout
            PrefsService.logout();
            Navigator.of(context)
            //remove todas as paginas anteriores e volta para login
            .pushNamedAndRemoveUntil('/login', (route) => true);
          }, 
          icon: Icon(Icons.logout))],
        ),
        body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (_, list, __) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, idx) => ListTile(
                leading: Text(list[idx].id.toString()),
                trailing: Icon(Icons.arrow_forward),
                title: Text(list[idx].title),
                //Ir para page details passando o obj clicado
                onTap: () => Navigator.of(context)
                    .pushNamed('/details', arguments: list[idx]), //passando argumento selecionado
              ),
              separatorBuilder: (_, __) => Divider(),
            );
          },
        ));
  }
}
