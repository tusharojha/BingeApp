import 'package:flutter/material.dart';

Widget welcomeLabel() {
  return Container(
    height: 100,
    child: Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Color.fromRGBO(248, 229, 12, 1), width: 5))),
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                      text: 'W',
                      style: TextStyle(color: Color.fromRGBO(248, 229, 12, 1))),
                  TextSpan(
                      text: 'E',
                      style: TextStyle(color: Color.fromRGBO(253, 1, 102, 1))),
                  TextSpan(
                      text: 'L',
                      style: TextStyle(color: Color.fromRGBO(0, 0, 92, 1))),
                  TextSpan(
                      text: 'C',
                      style: TextStyle(color: Color.fromRGBO(22, 255, 247, 1))),
                  TextSpan(
                      text: 'O',
                      style: TextStyle(color: Color.fromRGBO(0, 0, 92, 1))),
                  TextSpan(
                      text: 'M',
                      style: TextStyle(color: Color.fromRGBO(253, 1, 102, 1))),
                  TextSpan(
                      text: 'E',
                      style: TextStyle(color: Color.fromRGBO(22, 255, 247, 1))),
                ]),
          ),
          Expanded(
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(22, 255, 247, 1), width: 5))),
            ),
          ),
        ],
      ),
    ),
  );
}
