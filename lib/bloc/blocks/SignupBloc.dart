import 'package:binge/bloc/events/SigupEvents.dart';
import 'package:binge/bloc/states/SignupStates.dart';
import 'package:bloc/bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState>{
  @override
  SignupState get initialState => SignupIdle();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if(event is Signup){
      yield SignupLoading();
    } else if (event is SetAvatar) {
      yield SignupAvatarSet(avatar: event.avatar);
    }
  }

}