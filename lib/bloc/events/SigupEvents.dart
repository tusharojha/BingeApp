import 'package:binge/models/User.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class Signup extends SignupEvent {
  final User user;

  const Signup({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}
