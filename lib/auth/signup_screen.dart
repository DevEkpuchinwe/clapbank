import 'package:clapapp/auth/auth_service.dart';
import 'package:clapapp/auth/login_screen.dart';
import 'package:clapapp/navigation/navigator.dart';
import 'package:clapapp/widgets/button.dart';
import 'package:clapapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

import '../widgets/toast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text("Signup",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: "Enter Name",
              label: "Name",
              controller: _name,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              isPassword: true,
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Signup",
              onPressed: () async {
                await _signup(context);
              },
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () => goToLogin(context),
                child: const Text("Login", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  goToNavigator(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      );

  Future _signup(BuildContext context) async {
    String result = await _auth.createUserAndDatabase(
        _email.text, _password.text, _name.text);
    if (result == "success") {
      showToast(message: 'Account Created Successfully');
      if (context.mounted) {
        return goToNavigator(context);
      }
    } else {
      showToast(message: result);
    }
  }
}
