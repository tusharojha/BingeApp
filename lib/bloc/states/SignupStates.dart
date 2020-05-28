import 'package:binge/models/User.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupIdle extends SignupState {}

class SignupLoading extends SignupState {}

class SignupError extends SignupState {}

class SignupSuccessful extends SignupState {
  final User user;

  const SignupSuccessful({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}

class SignupAvatarSet extends SignupState {
  final int avatar;

  const SignupAvatarSet({@required this.avatar}) : assert(avatar != null);

  @override
  List<Object> get props => [avatar];
}