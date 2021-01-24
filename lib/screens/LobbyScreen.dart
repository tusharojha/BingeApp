import 'package:binge/assets/colors.dart';
import 'package:binge/widgets/UserCard.dart';
import 'package:flutter/material.dart';

class LobbyScreen extends StatefulWidget {
  @override
  _LobbyScreenState createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  CustomColors colors = new CustomColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '12345678',
                    style: TextStyle(
                      color: colors.withName("pink"),
                      fontSize: 50.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'YOUR 8 DIGIT ROOM CODE',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 7,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return UserCard(
                          name: 'TUSHAR OJHA',
                          starCount: 3,
                          avatar: 'assets/avatars/1.svg',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {},
              child: Text(
                'START',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              color: colors.withName("yellow"),
            ),
          ),
        ));
  }
}
