import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/registration_screen.dart';
import 'blocs/login/login_bloc.dart';
import 'bottom_nav_bar.dart';
import 'custom_page_route_widget.dart';
import 'custom_text_form_field.dart';
import 'light_theme.dart';
import 'my_button.dart';



class LoginScreen extends StatefulWidget {

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _savedData = "";
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }


  // Load data from shared preferences
  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('data') ?? "";
      print('_savedData::::::::$_savedData');
    });
  }

  // Save data to shared preferences
  void _saveData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('data', data);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/todo.png', // Replace with your image asset path
                  height: 150, // Adjust the height as needed
                ),
                const SizedBox(height: 20),
                const Text(
                  'TO DO APP',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                OutlinedTextFormField(
                  controller: _userNameController,
                  labelText: 'user name',
                  hintText: 'Enter your user name',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your user name';
                    }
                    return null;
                  },
                ),


                const SizedBox(height: 20),

                OutlinedTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 40),

                BlocConsumer<LoginBloc, LoginState>(
                  listenWhen: (previous, current) => current is LoginSuccess  || current is LoginFailure,

                  builder: (context, state) {
                    print("cccccccccccccccccccccccsarowar::::$state");
                    if (state is LoginLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return MyButton(
                      color: kColorPrimary,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          //final username = _userNameController.text;
                          //final password = _passwordController.text;
                          //print('username: $username, Password: $password');

                          context.read<LoginBloc>().add(LoginUser(
                            // username: _userNameController.text,
                            // password: _passwordController.text,
                            username: _userNameController.text,
                            firstname: "saaa",
                            lastname: "zzz",
                            password: _passwordController.text,

                          ));
                        }
                      },
                      text: 'Login',
                    );
                  },

                  listener: (context, state) {
                    if(state is LoginSuccess){
                      print("xxxxxxxxxxxxxxxxxxxxxx");
                      //print(state.loginData);
                      //Map decodedResponse = (state.loginData);



                      //String name = decodedResponse['user']['name'];
                      //print('Sarowar');
                     // print('Sarowar:$name');

                      _saveData('1');
                      _loadData();
                      Navigator.pushAndRemoveUntil(
                          context,
                          CustomPageRoute(
                            child: BottomNavBar(
                              index: 0,
                            ),
                            direction: AxisDirection.left,
                          ),
                              (route) => false);

                      //_submitForm();
                      //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context)=>HomeScreen())), (route) => false);
                    }

                    if (state is LoginFailure) {
                      print("Login Failed");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Login Failed'),
                            content: Text('Incorrect user Name or password. Please try again.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    // if(state is LoginFailure){
                    //   print("xxxxxxxxxxxxxxxxxxxxxx");
                    //   _submitForm();
                    //   //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context)=>HomeScreen())), (route) => false);
                    // }
                  },

                ),


                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text('Don\'t have an account? Sign up'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
