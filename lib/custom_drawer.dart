import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'light_theme.dart';
import 'login_screen.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      width: 250.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('john.doe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'JD',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            decoration: BoxDecoration(
              color: kColorPrimary,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('data', '');
              Navigator.pushAndRemoveUntil(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                    (route) => false,
              );
              // Navigator.of(context).pop(false);
              //Navigator.pop(context);
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Custom Section',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Favorites',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          CustomListTile(
            icon: Icons.settings,
            text: 'Custom Tile',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Additional Information',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Here you can put any additional information or widgets.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () => onTap(),
    );
  }
}
