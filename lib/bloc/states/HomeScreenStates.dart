import 'package:binge/models/User.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeScreenStates extends Equatable {
  const HomeScreenStates();

  @override
  List<Object> get props => [];
}

class InitialState extends HomeScreenStates {
  const InitialState();

  @override
  List<Object> get props => [];
}

class LoggedInState extends HomeScreenStates {
  final User user;

  const LoggedInState({@required this.user});

  @override
  List<Object> get props => [user];
}

class ErrorState extends HomeScreenStates {
  final String message;

  const ErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
