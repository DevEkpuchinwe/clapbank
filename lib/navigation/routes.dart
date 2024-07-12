//navigation route to screens for ontaps and onpressed

import 'package:clapapp/UI/comingsoon.dart';
import 'package:clapapp/auth/forget_password.dart';
import 'package:clapapp/widgets/error.dart';
import 'package:flutter/material.dart';

//import '../UI/airtime.dart';
//import '../UI/cable_tv.dart';
//import '../UI/clap_class.dart';
import '../UI/clap_coins.dart';
//import '../UI/data.dart';
import '../UI/homescreen.dart';
import '../UI/setting.dart';
import '../UI/trade_coins.dart';
import '../UI/transfer.dart';
import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';

goToFundScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TransferScreen()),
    );

goToTransferScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TransferScreen()),
    );

goToAirtimeScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComingScreen()),
    );

goToDataScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComingScreen()),
    );

goToCableScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComingScreen()),
    );

goToServiceScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComingScreen()),
    );

goToTradeScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TradeScreen()),
    );

goToClassScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComingScreen()),
    );

goToCoinsScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CoinsScreen()),
    );

goToSpinScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComingScreen()),
    );

goToNotificationScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComingScreen()),
    );

goToSettingScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingScreen()),
    );

goToLoginScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );

goToSignupScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupScreen()),
    );

goToHomeScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );

goToFundSuccess(BuildContext context) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => const ErrorScreen()));

goToErrorScreen(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ErrorScreen()),
    );

goToPasswordReset(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPassword()),
    );
