import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_nav_bar.dart';
import 'custom_page_route_widget.dart';
import 'login_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String _savedData = "";
  _isLogin()async{
    await Future.delayed(const Duration(milliseconds: 1200), () {
      // await AuthService().isUserLogin();
    }).then((value) {
      if (_savedData.isNotEmpty) {
        Navigator.pushAndRemoveUntil(
            context,
            CustomPageRoute(
              child: BottomNavBar(
                index: 0,
              ),
              direction: AxisDirection.left,
            ),
                (route) => false);


      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );


      }
    });
  }
  // _isLogin()async{
  //   await Future.delayed(const Duration(milliseconds: 1200), () {
  //     // await AuthService().isUserLogin();
  //   }).then((value) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => LoginScreen(),
  //         ),
  //       );
  //
  //   });
  // }


  // Load data from shared preferences
  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('data') ?? "";
    });
  }

  @override
  void initState() {
    _loadData();
    _isLogin();
    print('shared_preferences: $_savedData');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SizedBox(
        // height: size.height,
        // width: size.width,
        child: Center(
          child: SizedBox(
            height: 100,
            child: Image.asset(
              'assets/images/todo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
