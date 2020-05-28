import 'package:binge/models/User.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

class SetAvatar extends SignupEvent {
  final int avatar;

  const SetAvatar({@required this.avatar}) : assert(avatar != null);

  @override
  List<Object> get props => [avatar];
}
