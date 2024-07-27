part of 'login_bloc.dart';

// @immutable
// sealed class LoginEvent {}

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String username;
  final String firstname;
  final String lastname;
  final String password;

  const LoginUser({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}