import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUser>(_onLoginUser);
  }

  Future<void> _onLoginUser(LoginUser event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final response = await http.post(
        //Uri.parse('https://81259139-e22b-49d2-b02d-a4717d050c3b.mock.pstmn.io/user'),
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
     // print('zzzzzzzzzzzzzzzzzzzzzzzzzz');
      print(response.statusCode);
      //print(event.username);
     // print(event.password);

      if (response.statusCode == 200) {
         Map<String, dynamic> decodedResponse = jsonDecode(response.body);
         //String message = decodedResponse['message'];
        Map data=jsonDecode(response.body);
        emit( LoginSuccess(success: 'Login Success',loginData: data));
      } else {
        emit(const LoginFailure(error: 'Login Failed'));
      }
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }

}
