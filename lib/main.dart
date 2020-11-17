import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/facebook_login.dart';
import 'screens/linkedin_login.dart';

void main() {
  runApp(SMI_TSF());
}

class SMI_TSF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes:  <String, WidgetBuilder>{
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        LinkedInPage.id:(context)=>LinkedInPage(),
      },
    );
  }
}


