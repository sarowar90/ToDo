import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegistrationInitial()) {
    on<RegisterUser>(_onRegisterUser);
  }

  Future<void> _onRegisterUser(RegisterUser event, Emitter<RegisterState> emit) async {
    emit(RegistrationLoading());
    try {
      final response = await http.post(
        Uri.parse('https://64227824-c7bd-40cc-85cd-b185b6dfa1cc.mock.pstmn.io/adduser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': event.username,
          'firstname': event.firstname,
          'lastname': event.lastname,
          'password': event.password,
        }),
      );

      if (response.statusCode == 200) {
        Map data=jsonDecode(response.body);
        emit( RegistrationSuccess(success: 'Registration Success',registrationData: data));
      } else {
        emit(RegistrationFailure(error: 'Registration Failed'));
      }
    } catch (error) {
      emit(RegistrationFailure(error: error.toString()));
    }
  }
}
