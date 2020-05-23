import 'package:flutter/material.dart';

class CustomColors {
  Map<String, Color> colors;
  CustomColors(){
    colors = Map<String, Color>();
    colors['pink'] = Color.fromRGBO(253, 1, 102, 1);
    colors['yellow'] = Color.fromRGBO(248, 229, 12, 1);
    colors['blue'] = Color.fromRGBO(0, 0, 92, 1);
    colors['cyan'] = Color.fromRGBO(0, 255, 246, 1);
  }
  Color withName(String name){
    return colors[name];
  }
}
