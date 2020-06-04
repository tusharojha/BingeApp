import 'package:equatable/equatable.dart';

abstract class HomeScreenEvents extends Equatable {
  const HomeScreenEvents();

  @override
  List<Object> get props => [];
}

class GetLoggedInUser extends HomeScreenEvents {
  const GetLoggedInUser();

  @override
  List<Object> get props => [];
}
