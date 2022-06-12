import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool obscureText;

  const CustomTextFieldWidget({
    Key? key,
    required this.onChanged,
    required this.label,
    this.obscureText = false,
  }) : super(key: key);

  //remover tudo que é específico (_controller/onChanged()

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      //Disparado sempre que o usuário digitar um valor
      onChanged: onChanged,
      obscureText: obscureText, //usar em senha
    );
  }
}
