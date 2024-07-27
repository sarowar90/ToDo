part of 'login_bloc.dart';

// @immutable
// sealed class LoginState {}
//
// final class LoginInitial extends LoginState {}
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String success;
  final Map loginData;

  const LoginSuccess({required this.success,required this.loginData});

  @override
  List<Object> get props => [success];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}