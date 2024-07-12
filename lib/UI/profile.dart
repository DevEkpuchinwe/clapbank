import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

void main() => runApp(const ProfileScreen());

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLAP',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text('Your Profile is your personal gateway to '),
            const Text('managing your account information'),
            const CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.account_circle,
                size: 60.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'CLAP USER',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email),
                // ignore: unnecessary_string_interpolations
                Text('$userEmail'),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text('General Settings'),
            ListView(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.manage_accounts_rounded),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Personal Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Edit your information'),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.navigate_next_rounded),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Account,notifications,settings'),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.navigate_next_rounded),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.policy_rounded),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Legal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Help,Privacy and security'),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.navigate_next_rounded),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.logout_rounded),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Out',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Sign Out of your account'),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.navigate_next_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
