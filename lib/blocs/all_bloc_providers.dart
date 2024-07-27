import 'package:flutter_bloc/flutter_bloc.dart';
import 'Register/register_bloc.dart';
import 'login/login_bloc.dart';

class AllBlocProviders {
  static List getAllBlocProviders = [
     BlocProvider(create: (context) => RegisterBloc()),
     BlocProvider(create: (context) => LoginBloc()),


  ];
}
