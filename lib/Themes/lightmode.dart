import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    useMaterial3: true,
    appBarTheme:const AppBarTheme(
      backgroundColor: Color(0xFFEEEFF5),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black)
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
    )
);