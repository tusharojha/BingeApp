import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../events/SplashScreenEvents.dart';
import '../states/SplashScreenStates.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvents, SplashScreenStates> {
  @override
  SplashScreenStates get initialState => InitialState();

  @override
  Stream<SplashScreenStates> mapEventToState(SplashScreenEvents event) async* {
    if (event is GetLoginState) {
      yield await _getLoggedInUser();
    }
  }

  Future<SplashScreenStates> _getLoggedInUser() {
    return Future.delayed(Duration(seconds: 2), () async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (sharedPreferences.getString("user") != null) {
        return GoToHomeScreen();
      }
      return GoToSignupScreen();
    });
  }
}
