import 'package:flutter/material.dart';

import '../Themes/lightmode.dart';
import '../Themes/darkmode.dart';

class ThemeProvider extends ChangeNotifier{

   ThemeData _theme = lightMode ;
  ThemeData get theme => _theme;

  void toggleTheme(){

    final isDark = _theme == lightMode ;

    if(isDark){
      _theme = darkMode;
    }else{
      _theme = lightMode;
    }
    notifyListeners();
  }

}