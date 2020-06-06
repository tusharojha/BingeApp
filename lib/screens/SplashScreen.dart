import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splashscreenbloc.dart';
import '../widgets/AppLogo.dart';
import 'HomeScreen.dart';
import 'SignupScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _bloc = SplashScreenBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (_bloc.state is InitialState) {
      _bloc.add(GetLoginState());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<SplashScreenBloc, SplashScreenStates>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is GoToHomeScreen) {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            } else if (state is GoToSignupScreen) {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignupScreen()));
            }
          },
          child: appLogo(),
        ),
      ),
    );
  }
}
