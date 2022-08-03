import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_api_v2/bloc/auth/auth_event.dart';
import 'package:flutter_demo_api_v2/bloc/auth/auth_state.dart';
import 'package:flutter_demo_api_v2/bloc/auth/auth_status.dart';
import 'package:flutter_demo_api_v2/repo/auth_repo.dart';

//Auth Status
class AuthBloc extends Bloc<AuthEvent, AuthState>{

  final AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is AuthVisiblePassword){
      yield state.copyWith(isShow: event.isShow);
    } else if(event is AuthPasswordChanged){
      yield state.copyWith(password: event.text);
    } else if(event is AuthSubmitted){
      yield state.copyWith(authStatus: AuthShowLoading());
      try{
        List<String> list = await authRepo.login(event.username, event.password);

        yield state.copyWith(authStatus: AuthOnSuccess(list));
      } on Exception catch (e){
        yield state.copyWith(authStatus: AuthOnFailed(e));
      }
    }
  }

}