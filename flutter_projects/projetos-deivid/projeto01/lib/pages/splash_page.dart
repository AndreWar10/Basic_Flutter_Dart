import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  //initState é executado assim que minha page é criada, sendo a primeira coisa a ser executada
  void initState() {
    super.initState();
    //Tempo de espera quando inicia o App, e depois direcionar para a primeira pagina do App, usando
    //pushReplacementNamed para nao dar ao usuario a opção de voltar a tela inicial, sobrepondo a Splash
    Future.delayed(Duration(seconds: 3)).then(
      (_) => Navigator.of(context).pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade700,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white54,
        ),
      ),
    );
  }
}
