import 'package:flutter/material.dart';
import 'package:projeto01/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;
  
  const CustomLoginButtonComponent({ Key? key, required this.loginController }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
              valueListenable: loginController.inLoader,
              builder: (_, inLoader, __) => inLoader
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        loginController.auth().then(
                          (result) {
                            //se autenticação: true
                            if (result) {
                              //print('sucess');
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Falha ao realizar login'),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            }
                          },
                        );
                      },
                      child: Text('Login'),
                    ),
            );
  }
}