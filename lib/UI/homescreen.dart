import 'dart:async';

//import 'package:clapapp/UI/airtime.dart';
//import 'package:clapapp/UI/cable_tv.dart';
//import 'package:clapapp/UI/clap_class.dart';
//import 'package:clapapp/UI/clap_coins.dart';
//import 'package:clapapp/UI/data.dart';
//import 'package:clapapp/UI/service.dart';
//import 'package:clapapp/UI/spin.dart';
//import 'package:clapapp/UI/trade_coins.dart';
import 'package:clapapp/UI/comingsoon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../auth/auth_service.dart';
import '../navigation/routes.dart';
import '../widgets/actionbutton.dart'; // ignore: library_prefixes
import 'trade_coins.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLAP',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      //darkTheme: ThemeData.dark(),
      //themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }

  @override
  HomeScreenState createState() => HomeScreenState();
}

void _navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

class HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<dynamic, dynamic>? _userData;
  bool _isLoading = true;
  String _errorMessage = '';
  var username = '';
  var balance = 0.00;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map data = documentSnapshot.data() as Map<dynamic, dynamic>;
        setState(() {
          _userData = {
            username: data['name'] ?? '',
            balance: data['balance']?.toDouble() ?? 0.0,

            //'username' = data['name'],
            //'balance' = data['balance'],
          };
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = ' Document Doesnt Exists';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _errorMessage.isNotEmpty
                ? Center(
                    child: Text('Error : $_errorMessage'),
                  )
                : _userData == null
                    ? const Center(child: Text('No data found'))
                    : SafeArea(
                        child: Column(
                          children: <Widget>[
                            Marquee(
                              text:
                                  'HI ${_userData!['username']},ENJOY THE EXTRAORDINARY SERVICE,THIS IS A FIRST RELEASE AND WE ARE WORKING OUT MORE FEATURES FOR YOU. PLEASE STAY TUNE AS WE WILL UPDATE THIS APP',
                              scrollAxis: Axis.horizontal,
                              accelerationDuration: const Duration(seconds: 2),
                              decelerationDuration: const Duration(
                                milliseconds: 500,
                              ),
                              velocity: 50.0,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.deepOrangeAccent),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2.0),
                                  height: 200.0,
                                  width: 600.0,
                                  child: Card(
                                    color: Colors.deepOrange,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Text('Total Balance',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 20.0,
                                                )),
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'NGN ${_userData!['balance']}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Row(children: <Widget>[
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Card(
                                                color: Colors.orange[400],
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ElevatedButton.icon(
                                                  icon: const Icon(
                                                    Icons
                                                        .add_circle_outline_rounded,
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    size: 25,
                                                  ),
                                                  onPressed: () {
                                                    goToFundScreen(context);
                                                  },
                                                  label: const FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      'FUND',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Card(
                                                  color: Colors.orange[400],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: ElevatedButton.icon(
                                                    icon: const Icon(
                                                      Icons.send_rounded,
                                                      color: Colors.deepOrange,
                                                      size: 25,
                                                    ),
                                                    onPressed: () {
                                                      goToTransferScreen(
                                                          context);
                                                    },
                                                    label: const FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        'TRANSFER',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .deepOrangeAccent,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'Quick Actions',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ActionButton(
                                          icon: Icons.call,
                                          label: 'Airtime',
                                          onPressed: () {
                                            _navigateToScreen(
                                                context, const ComingScreen());
                                          },
                                        ),
                                        ActionButton(
                                          icon: Icons.wifi,
                                          label: 'Data',
                                          onPressed: () {
                                            _navigateToScreen(
                                                context, const ComingScreen());
                                          },
                                        ),
                                        ActionButton(
                                          icon: Icons.desktop_mac_rounded,
                                          label: 'Cable TV',
                                          onPressed: () {
                                            _navigateToScreen(
                                                context, const ComingScreen());
                                          },
                                        ),
                                        ActionButton(
                                          icon: Icons.tips_and_updates_rounded,
                                          label: 'Electricity',
                                          onPressed: () {
                                            _navigateToScreen(
                                                context, const ComingScreen());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ActionButton(
                                          icon: Icons.sports_esports_rounded,
                                          label: 'Betting',
                                          onPressed: () {
                                            _navigateToScreen(
                                                context, const ComingScreen());
                                          },
                                        ),
                                        ActionButton(
                                          icon: Icons.school_rounded,
                                          label: 'Exams',
                                          onPressed: () {
                                            _navigateToScreen(
                                                context, const TradeScreen());
                                          },
                                        ),
                                        ActionButton(
                                          icon: Icons.real_estate_agent_rounded,
                                          label: 'Loans',
                                          onPressed: () {
                                            _navigateToScreen(
                                                context, const ComingScreen());
                                          },
                                        ),
                                        ActionButton(
                                          icon: Icons.more_horiz_rounded,
                                          label: 'More',
                                          onPressed: () {
                                            _navigateToScreen(
                                                context, const ComingScreen());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
  }
}
