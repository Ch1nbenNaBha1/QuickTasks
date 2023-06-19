import 'package:flutter/material.dart';

ThemeData darkMode =ThemeData(
    useMaterial3: true,
    appBarTheme:const AppBarTheme(
      backgroundColor: Colors.black54,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black)
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(

    )
);
