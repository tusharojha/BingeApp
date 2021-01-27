import 'package:binge/assets/colors.dart';
import 'package:binge/bloc/homescreenbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final customColors = CustomColors();
  final _bloc = HomeScreenBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetLoggedInUser());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeScreenBloc, HomeScreenStates>(
          bloc: _bloc,
          builder: (context, state) {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        state is LoggedInState
                            ? 'assets/avatars/${state.user.avatar}.svg'
                            : 'assets/avatars/1.svg',
                      ),
                    ),
                    Container(
                      height: 45.0,
                      width: MediaQuery.of(context).size.width * 0.60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: customColors.withName('blue'),
                      ),
                      child: Text(
                        state is LoggedInState
                            ? state.user.name.toUpperCase()
                            : 'WELCOME',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025,),
                    Container(
                      height: 45.0,
                      width: MediaQuery.of(context).size.width * 0.1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: customColors.withName('blue'),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025,),
                  ],
                ),
                Container(
                  color: customColors.withName('pink'),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'MATCHES WON',
                              style: TextStyle(
                                color: customColors.withName('blue'),
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '34 / 67',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'BINGE STARS',
                              style: TextStyle(
                                color: customColors.withName('blue'),
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '5 / 7',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: SvgPicture.asset(
                    'assets/logo/logo.svg',
                  ),
                ),
                Text(
                  'SELECT ANYONE',
                  style: GoogleFonts.getFont(
                    'Chelsea Market',
                    fontSize: 30,
                    color: customColors.withName('blue'),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: CustomPath(),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width,
                          color: customColors.withName('pink'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(top: 40, bottom: 40),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 30,
                                  offset: Offset(20, 20),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                              color: customColors.withName('blue'),
                            ),
                            width: 0.45 * MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                'CREATE ROOM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 30,
                                  offset: Offset(20, 20),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                              color: customColors.withName('blue'),
                            ),
                            margin:
                                EdgeInsets.only(top: 40, bottom: 40, left: 10),
                            width: 0.45 * MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                'JOIN ROOM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.addArc(
        Rect.fromCenter(
            center: Offset(0.01 * size.width, size.height),
            width: 1.5 * size.width,
            height: 1.5 * size.height),
        size.width,
        size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomPath oldClipper) {
    return true;
  }
}
