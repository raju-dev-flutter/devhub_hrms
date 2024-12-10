import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../app.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(initialState()) {
    on<AuthenticationEvent>(_authenticationEvent);
  }

  final AuthenticationRepository _authenticationRepository;

  static initialState() => AuthenticationUninitialized();

  void _authenticationEvent(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    if (event is AppStarted) {
      await Future.delayed(const Duration(seconds: 2));
      final bool hasPermission =
          await _authenticationRepository.hasPermission();
      final bool hasToken = await _authenticationRepository.hasToken();
      if (!hasPermission) {
        emit(AppPermissionNotGranted());
      } else if (!hasToken) {
        emit(AuthenticationUnauthenticated());
      } else {
        emit(AuthenticationAuthenticated());
      }
    }
    if (event is AppPermission) {
      Log.i('====== Permission ==========');
      await _authenticationRepository.persistedPermission(event.permission);
      final bool hasPermission =
          await _authenticationRepository.hasPermission();
      final bool hasToken = await _authenticationRepository.hasToken();
      if (!hasPermission) {
        emit(AppPermissionNotGranted());
      } else if (!hasToken) {
        emit(AuthenticationUnauthenticated());
      } else {
        emit(AuthenticationAuthenticated());
      }
    }
    if (event is AppGetStarted) {
      Log.i('====== APP GET STARTED ==========');
      await _authenticationRepository.persistedGetStart(event.isStart);
      emit(AuthenticationAuthenticated());
    }
    if (event is LoggedIn) {
      Log.i('====== LoggedIn ==========');
      emit(AuthenticationAuthenticated());
    }
    if (event is LoggedOut) {
      await _authenticationRepository.deleteToken();
      emit(AuthenticationUnauthenticated());
    }
  }
}
