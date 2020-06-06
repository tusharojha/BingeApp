import 'package:equatable/equatable.dart';

abstract class SplashScreenStates extends Equatable{
  const SplashScreenStates();

  @override
  List<Object> get props => [];
}

class InitialState extends SplashScreenStates{
  const InitialState();

  @override
  List<Object> get props => [];
}

class GoToHomeScreen extends SplashScreenStates{
  const GoToHomeScreen();

  @override
  List<Object> get props => [];
}

class GoToSignupScreen extends SplashScreenStates{
  const GoToSignupScreen();

  @override
  List<Object> get props => [];
}

