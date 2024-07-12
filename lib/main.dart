import 'package:clapapp/UI/homescreen.dart';
import 'package:clapapp/auth/login_screen.dart';
import 'package:clapapp/auth/signup_screen.dart';
import 'package:clapapp/auth/welcomescreen.dart';
import 'package:clapapp/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    //apiKey: "AIzaSyDC6T_lxIkgsfv9V3wl-K-MOm35K7xEHjg",
    //authDomain: "clap-a85c0.firebaseapp.com",
    //appId: "1:236853421270:android:10bc1c1046bacc6e0d9577",
    //messagingSenderId: "236853421270",
    //projectId: "clap-a85c0",
    //storageBucket: "clap-a85c0.appspot.com",
    //databaseURL: "https://clap-a85c0-default-rtdb.firebaseio.com",
    //measurementId: "G-NPXFJ7L2LB",
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
      routes: {
        '/welcomescreen': (context) => const WelcomeScreen(),
        '/loginscreen': (context) => const LoginScreen(),
        '/signupscreen': (context) => const SignupScreen(),
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}
