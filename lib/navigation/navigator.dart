import 'package:clapapp/UI/clap_coins.dart';
import 'package:clapapp/UI/homescreen.dart';
import 'package:clapapp/UI/profile.dart';
import 'package:clapapp/UI/wallet.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(const NavigationScreen());

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLAP',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const NavigationScreen(),
    );
  }

  @override
  NavigationScreenState createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final List _listPages = [];
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _listPages
      ..add(const HomeScreen())
      ..add(const CoinsScreen())
      ..add(const WalletScreen())
      ..add(const ProfileScreen());
    _currentPage = const HomeScreen();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CLAP',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        //title: const Text('CLAP'),
        backgroundColor: Colors.deepOrange,
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.circle_notifications_rounded,
              color: Colors.white,
              size: 15,
            ),
            onPressed: () {
              goToNotificationScreen(context);
            },
          ),
          IconButton(
            onPressed: () {
              goToSettingScreen(context);
            },
            icon: const Icon(
              Icons.support_agent_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
        ],
      ),
      // appBar: AppBar(
      //  title: const Text('CLAP'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrange,
        showSelectedLabels: true,
        iconSize: 40,
        selectedFontSize: 20,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_rounded),
            label: 'Coins',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
