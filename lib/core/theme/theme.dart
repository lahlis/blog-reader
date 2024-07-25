import 'package:blog/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //_border precisa ser uma função, pois sua cor mudará de acordo com o que for passado
  //ao inserior o parâmetro em [], se cria um valor default. caso não seja passado nada pelo construtor, a função irá utilizar essa cor cinza
  static  _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide:  BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
    inputDecorationTheme:  InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      
    ),
  );
}
