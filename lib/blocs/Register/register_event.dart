part of 'register_bloc.dart';


abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  final String username;
  final String firstname;
  final String lastname;
  final String password;

  const RegisterUser({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.password,
  });

  @override
  List<Object> get props => [username, firstname, lastname, password];
}
