part of 'register_bloc.dart';



abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegisterState {}

class RegistrationLoading extends RegisterState {}

class RegistrationSuccess extends RegisterState {
  final String success;
  final Map registrationData;


  const RegistrationSuccess({required this.success,required this.registrationData});

  @override
  List<Object> get props => [success];
}

class RegistrationFailure extends RegisterState {
  final String error;

  const RegistrationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
