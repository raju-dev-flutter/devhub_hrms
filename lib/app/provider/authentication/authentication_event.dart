part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  const AppStarted();

  @override
  String toString() => 'AppStarted';
}

class AppPermission extends AuthenticationEvent {
  final bool permission;
  const AppPermission({required this.permission});

  @override
  List<Object> get props => [permission];

  @override
  String toString() => 'App Permission {$permission}';
}

class AppGetStarted extends AuthenticationEvent {
  final bool isStart;

  const AppGetStarted({required this.isStart});

  @override
  List<Object> get props => [isStart];

  @override
  String toString() => 'App Start {$isStart}';
}

class LoggedIn extends AuthenticationEvent {
  const LoggedIn();
}

class LoggedOut extends AuthenticationEvent {
  const LoggedOut();
}
