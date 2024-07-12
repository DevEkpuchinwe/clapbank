import 'package:clapapp/auth/auth_service.dart';
import 'package:clapapp/auth/signup_screen.dart';
import 'package:clapapp/navigation/navigator.dart';
import 'package:clapapp/widgets/button.dart';
import 'package:clapapp/widgets/textfield.dart';
import 'package:clapapp/widgets/toast.dart';
import 'package:flutter/material.dart';

import '../navigation/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
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
            const Text("Welcome Back",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(height: 50),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Login",
              onPressed: () async {
                await _login(context);
              },
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Forgot Your Password ? "),
              InkWell(
                onTap: () => goToPasswordReset(context),
                child: const Text("Reset", style: TextStyle(color: Colors.red)),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't Have An Account ? "),
              InkWell(
                onTap: () => goToSignup(context),
                child:
                    const Text("Signup", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToNavigator(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      );

  Future _login(BuildContext context) async {
    String result =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (result == "success") {
      showToast(message: "Successfully Logged in");
      //log("User Logged In");
      if (context.mounted) {
        return goToNavigator(context);
      }
    } else {
      showToast(message: result);
    }
  }
}
