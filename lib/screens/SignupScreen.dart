import 'package:binge/assets/colors.dart';
import 'package:binge/widgets/AvatarOption.dart';
import 'package:binge/widgets/WelcomeLabel.dart';
import 'package:binge/bloc/signupbloc.dart';
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
        child: SingleChildScrollView(
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
                margin: EdgeInsets.all(5),
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
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          style: GoogleFonts.getFont(
                              'Chelsea Market', fontSize: 20, color: Colors.black),
                          children: [
                            TextSpan(text: 'PICK A '),
                            TextSpan(text: 'USERNAME', style: TextStyle(color: colors.withName('pink')))
                          ]
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      cursorColor: colors.withName('pink'),
                      style: GoogleFonts.getFont('Chelsea Market', fontSize: 18),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: colors.withName('pink'), width: 5),),
                          focusedBorder
                              : UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.withName(
                                'pink'),
                                width: 5),)
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 2, offset: Offset(1.0, 3.0), color: Colors.grey)]),
                child: IconButton(
                  iconSize: 50,
                  onPressed: (){},
                  icon: Icon(Icons.chevron_right, color: colors.withName('pink'),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}