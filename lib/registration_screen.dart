import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/Register/register_bloc.dart';
import 'custom_text_form_field.dart';
import 'light_theme.dart';
import 'login_screen.dart';
import 'my_button.dart';



class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Form"),
        centerTitle: true,
        backgroundColor: kColorPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedTextFormField(
                controller: _nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),
              OutlinedTextFormField(
                controller: _firstNameController,
                labelText: 'First Name',
                hintText: 'Enter First Name',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter First Name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),
              OutlinedTextFormField(
                controller: _lastNameController,
                labelText: 'Last Name',
                hintText: 'Enter Last Name',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Last Name';
                  }
                  return null;
                },
              ),


              SizedBox(height: 10),
              OutlinedTextFormField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              BlocConsumer<RegisterBloc, RegisterState>(
                listenWhen: (previous, current) => current is RegistrationSuccess || current is RegistrationFailure,
                builder: (context, state) {
                  print("cccccccccccccccccccccccSSSSSSSSSS$state");
                  if (state is RegistrationLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  // if (state is RegistrationFailure) {
                  //   return const Center(child: Text("Registration Failure"));
                  // }

                  return MyButton(
                    color: kColorPrimary,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        context.read<RegisterBloc>().add(RegisterUser(
                          username: _nameController.text,
                          firstname: _firstNameController.text,
                          lastname: _lastNameController.text,
                          password: _passwordController.text,
                        ));
                      }
                    },
                    text: 'Submit',
                  );

                },
                listener: (context, state) {
                  if(state is RegistrationSuccess){
                    print("xxxxxxxxxxxxxxxxxxxxxxSSSSSSSSSS");
                    print(state.registrationData);
                    // Map decodedResponse = (state.registrationData);
                    // String message = decodedResponse['message'];

                    _submitForm();
                    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context)=>HomeScreen())), (route) => false);
                  }

                  if (state is RegistrationFailure) {
                    print("Registration Failed");
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Registration Failed'),
                          content: Text('Incorrect Items. Please try again.'),
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


                },

              ),
            ],
          ),
        ),
      ),
    );

  }

  void _submitForm() {
    // Handle the form submission, e.g., sending data to a server
    print('Name: ${_nameController.text}');


    // Show a success message or navigate to another page
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Submitted'),
        content: Text('submitted successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context)=>LoginScreen())), (route) => false);
            },
            //=> Navigator.pop(context),
            //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context)=>HomeScreen())), (route) => false);
            child: Text('OK'),
          ),

        ],
      ),
    );
  }

}











