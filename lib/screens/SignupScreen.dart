import 'package:binge/assets/colors.dart';
import 'package:binge/widgets/AvatarOption.dart';
import 'package:binge/widgets/WelcomeLabel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  CustomColors colors = new CustomColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            welcomeLabel(),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: [
                      TextSpan(
                          text: 'SELECT YOUR ',
                          style: GoogleFonts.getFont('Chelsea Market')
                      ),
                      TextSpan(
                          text: 'ALTER EGO',
                          style: GoogleFonts.getFont('Chelsea Market',
                              color: Color.fromRGBO(253, 1, 102, 1))
                      )
                    ]
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Wrap(
                children: <Widget>[
                  AvatarOption(color: colors.withName("yellow"), avatar: 1,),
                  AvatarOption(color: colors.withName("pink"), avatar: 2,),
                  AvatarOption(color: colors.withName("blue"), avatar: 3,),
                  AvatarOption(color: colors.withName("cyan"), avatar: 4,),
                  AvatarOption(color: colors.withName("blue"), avatar: 5,),
                  AvatarOption(color: colors.withName("pink"), avatar: 6,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: Row(
                children: <Widget>[
                  Text('USERNAME', style: GoogleFonts.getFont(
                      'Chelsea Market', fontSize: 20),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
