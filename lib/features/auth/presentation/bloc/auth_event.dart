import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoginWithEmail extends AuthEvent {
  final String email;
  final String password;

  const LoginWithEmail(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class RegisterWithEmail extends AuthEvent {
  final String email;
  final String password;

  const RegisterWithEmail(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LoginWithGoogle extends AuthEvent {}

class LogoutRequested extends AuthEvent {}
