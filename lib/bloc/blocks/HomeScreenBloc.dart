import 'dart:convert';

import 'package:binge/bloc/events/HomeScreenEvents.dart';
import 'package:binge/bloc/states/HomeScreenStates.dart';
import 'package:binge/models/User.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvents, HomeScreenStates> {
  @override
  HomeScreenStates get initialState => InitialState();

  @override
  Stream<HomeScreenStates> mapEventToState(HomeScreenEvents event) async* {
    if (event is GetLoggedInUser) {
      yield await _getUser();
    }
  }

  Future<HomeScreenStates> _getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("user") != null) {
      final user =
          User.fromJson(jsonDecode(sharedPreferences.getString("user")));
      return LoggedInState(user: user);
    }else{
      return ErrorState(message: "USER DOESN'T EXISTS");
    }
  }
}
