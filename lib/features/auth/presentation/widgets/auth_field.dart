import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false, //por default, será falso, ou seja, será possível ver o texto. só será true em password
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      //validator: fornece um argumento do tipo string e com base nisso, se pode validar todo o textformfield
      //retorna um erro se o input for inválido ou null
      //a validação é feita utilizando o formkey no signup_page
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing!";
        }
        return null; //retorna null quando não há nenhum erro
      },
      obscureText: isObscureText,
    );
  }
}
