import 'dart:convert';

import 'package:binge/bloc/events/SigupEvents.dart';
import 'package:binge/bloc/states/SignupStates.dart';
import 'package:binge/config/config.dart';
import 'package:binge/models/User.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  @override
  SignupState get initialState => SignupIdle();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is Signup) {
      yield SignupLoading();
      yield await _signupUser(event.user);
    } else if (event is SetAvatar) {
      yield SignupAvatarSet(avatar: event.avatar);
    }
  }

  Future<SignupState> _signupUser(User user) async {
    Map<String, dynamic> query = new Map<String, dynamic>();
    query['token'] = TOKEN_ROUTE;
    query['name'] = user.name;
    query['avatar'] = user.avatar;
    query['fcmToken'] = user.fcmToken;

    final response = await http.post(BASE_URL + '/user',
        headers: JSON_HEADER, body: jsonEncode(query));

    if (response.statusCode == 201) {
      if (response.headers['x-auth'] != null) {
        user.token = response.headers['x-access-token'];
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('user', user.toJson());
        return SignupSuccessful(user: user);
      } else {
        return SignupError(message: 'ERROR D_SIGNUP: Internal Server Error');
      }
    } else {
      return SignupError(message: 'ERROR S_SIGNUP: Internal Server Error');
    }
  }
}
