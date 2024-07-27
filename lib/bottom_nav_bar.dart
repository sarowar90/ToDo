
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common_strings.dart';
import 'global_variable.dart';
import 'home_screen.dart';
import 'light_theme.dart';



class BottomNavBar extends StatefulWidget {
  int index = 0;
  BottomNavBar({super.key, required this.index});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  String token = "";
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('data') ?? "";
      api_token =token;
      print('_savedData::::::::$token');

    });
  }

  final screens = [
     HomeScreen(),
     HomeScreen(),
     HomeScreen(),
     HomeScreen(),
     HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.index == 0 ? true : false,
      //============> when you other pages this time you click back button then comeback HomeScreen
      onPopInvoked: (didPop) async {
        if (widget.index != 0) {
          setState(() {
            widget.index = 0;
          });
        }
      },
      child: Scaffold(
        body: screens[widget.index],
        bottomNavigationBar: Visibility(
          //visible: widget.index != 3, // Hide bottom nav bar when index is 3
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              height: 60.0,
              elevation: 10,
              shadowColor: Colors.red,
              surfaceTintColor: Colors.white,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            ),
            child: NavigationBar(
              selectedIndex: widget.index,
              onDestinationSelected: (index) async {
                setState(() {
                  widget.index = index;
                });
              },
              destinations: const [
                CustomNavigationDestination(
                    label: 'home', navImageUrl: more),
                CustomNavigationDestination(
                    label: 'home', navImageUrl: more),
                CustomNavigationDestination(
                    label: 'home', navImageUrl: more),
                CustomNavigationDestination(label: 'home', navImageUrl: more),
                CustomNavigationDestination(
                    label: 'home', navImageUrl: more),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNavigationDestination extends StatelessWidget {
  final String label;
  final String navImageUrl;
  const CustomNavigationDestination(
      {required this.label, required this.navImageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          const SizedBox(),
          SvgPicture.asset(
            navImageUrl,
            height: 27.0,
            width: 27.0,
            fit: BoxFit.cover,
            color: kColorGrey,
          ),
          Text(
            label,
            style: kStyleTextW500CG.copyWith(fontSize: 10.0),
          ),
          SizedBox(
            height: 2.0,
          )
        ],
      ),
      label: label,
      selectedIcon: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          const Divider(
            height: 0,
            indent: 28,
            endIndent: 28,
            color: Colors.green,
            thickness: 2.5,
          ),
          SvgPicture.asset(
            navImageUrl,
            height: 27.0,
            width: 27.0,
            fit: BoxFit.cover,
            color: kColorPrimary,
          ),
          Text(
            label,
            style: kStyleTextW500CP.copyWith(fontSize: 10.0),
          ),
          SizedBox(
            height: 2.0,
          )
        ],
      ),
    );
  }
}
