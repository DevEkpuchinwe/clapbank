import 'package:clapapp/auth/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const WelcomeScreen());

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLAP',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('CLAP'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 15,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  repeat: ImageRepeat.repeat,
                  image: AssetImage('assests/images/welcome.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 180,
                height: 42,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.skip_next,
                      color: Colors.deepOrangeAccent),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  label: const Text(
                    'NEXT',
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
