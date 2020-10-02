import 'package:flutter/material.dart';

class CustomColors {
  Map<String, Color> colors;
  CustomColors(){
    colors = Map<String, Color>();
    colors['pink'] = Color.fromRGBO(253, 1, 102, 1);
    colors['yellow'] = Color.fromRGBO(248, 229, 12, 1);
    colors['blue'] = Color.fromRGBO(0, 0, 92, 1);
    colors['brown'] = Color.fromRGBO(135, 54, 0, 1);
    colors['orange'] = Color.fromRGBO(255, 167, 38, 1);
    colors['green'] = Color.fromRGBO(100, 221, 23, 1);
  }
  Color withName(String name){
    return colors[name];
  }
}
