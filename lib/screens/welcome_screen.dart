import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:SMI_TSF/screens/facebook_login.dart';
import 'package:SMI_TSF/screens/linkedin_login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'Welcome Screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = ColorTween(begin: Colors.blue, end: Color(0xff132743))
        .animate(controller);

    controller.forward();

    animation.addStatusListener((status) {
      print(status);
    });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/background.png'))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60,
                      ),
                    ),
                    ColorizeAnimatedTextKit(
                      text: ['The Spark Foundation'],
                      textStyle: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Raleway',
                          color: Colors.white),
                      colors: [
                        Colors.white,
                        Colors.yellowAccent,
                        Colors.red,
                        Colors.green,
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                text: 'Sign In with Facebook',
                elevation: 6,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              SizedBox(height: 20),
              SignInButton(
                Buttons.LinkedIn,
                onPressed: () {
                  Navigator.pushNamed(context, LinkedInPage.id);
                },
                text: 'Sign In with LinkedIn',
                elevation: 6,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
