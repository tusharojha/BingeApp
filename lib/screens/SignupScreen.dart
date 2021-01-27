import 'package:binge/assets/colors.dart';
import 'package:binge/bloc/signupbloc.dart';
import 'package:binge/models/User.dart';
import 'package:binge/widgets/AvatarOption.dart';
import 'package:binge/widgets/WelcomeLabel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomeScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  CustomColors colors = new CustomColors();
  TextEditingController _username = new TextEditingController();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (BuildContext context) => SignupBloc(),
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                return Column(
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
                                  style: GoogleFonts.getFont('Chelsea Market')),
                              TextSpan(
                                  text: 'ALTER EGO',
                                  style: GoogleFonts.getFont('Chelsea Market',
                                      color: Color.fromRGBO(253, 1, 102, 1)))
                            ]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Wrap(
                        children: <Widget>[
                          AvatarOption(
                            color: colors.withName("orange"),
                            avatar: 1,
                          ),
                          AvatarOption(
                            color: colors.withName("brown"),
                            avatar: 2,
                          ),
                          AvatarOption(
                            color: colors.withName("green"),
                            avatar: 3,
                          ),
                          AvatarOption(
                            color: colors.withName("pink"),
                            avatar: 4,
                          ),
                          AvatarOption(
                            color: colors.withName("blue"),
                            avatar: 5,
                          ),
                          AvatarOption(
                            color: colors.withName("yellow"),
                            avatar: 6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.getFont('Chelsea Market',
                                  fontSize: 20, color: Colors.black),
                              children: [
                                TextSpan(text: 'PICK A '),
                                TextSpan(
                                  text: 'USERNAME',
                                  style: TextStyle(
                                    color: colors.withName('pink'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            controller: _username,
                            maxLength: 15,
                            textAlign: TextAlign.center,
                            autocorrect: false,
                            cursorColor: colors.withName('orange'),
                            style: GoogleFonts.getFont('Chelsea Market',
                                fontSize: 20),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.withName('orange'), width: 5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.withName('orange'), width: 5),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 2,
                              offset: Offset(1.0, 3.0),
                              color: Colors.grey)
                        ],
                      ),
                      child: IconButton(
                        iconSize: 50,
                        onPressed: () {
                          if (state is SignupAvatarSet) {
                            if (_username.text.isNotEmpty) {
                              if (_username.text.length >= 3) {
                                firebaseMessaging.getToken().then((token) {
                                  context.bloc<SignupBloc>().add(Signup(
                                      user: new User(_username.text,
                                          state.avatar, token)));
                                });
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  new SnackBar(
                                    content:
                                        Text('Pick an username to continue'),
                                  ),
                                );
                              }
                            } else {
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                  content:
                                      Text('Pick an username to continue')));
                            }
                          } else {
                            Scaffold.of(context).showSnackBar(new SnackBar(
                                content:
                                    Text('Choose an alter ego to continue')));
                          }
                        },
                        icon: Icon(
                          Icons.chevron_right,
                          color: colors.withName('pink'),
                        ),
                      ),
                    ),
                    BlocListener<SignupBloc, SignupState>(
                      listener: (context, state) {
                        if (state is SignupError) {
                          // dismiss loading dialog
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');

                          // show Error in Snackbar
                          Scaffold.of(context).showSnackBar(
                              new SnackBar(content: Text(state.message)));
                        } else if (state is SignupLoading) {
                          // shows loading dialog
                          showDialog(
                              context: context,
                              child: AlertDialog(
                                content: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: <Widget>[
                                      CircularProgressIndicator(
                                        backgroundColor: Colors.green,
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Colors.red),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text('Loading...')),
                                    ],
                                  ),
                                ),
                              ),
                              barrierDismissible: false);
                        } else if (state is SignupSuccessful) {
                          // dismiss loading dialog
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        }
                      },
                      child: Container(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
