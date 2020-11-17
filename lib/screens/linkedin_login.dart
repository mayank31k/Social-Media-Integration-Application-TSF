import 'package:flutter/material.dart';
import 'package:SMI_TSF/components/roundbutton.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:SMI_TSF/components/linkedin_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LinkedInPage extends StatefulWidget {
  static const String id = 'LinkedIn Page';
  @override
  State createState() => _LinkedInPageState();
}

class _LinkedInPageState extends State<LinkedInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: AppBar(
        backgroundColor: Color(0xFF111328),
        title: Text("SMI_TSF"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo.png'),
                  height: 300,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LinkedInButtonStandardWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LinkedInuser(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                iconHeight: 40,
                iconWeight: 40,
                textPadding: EdgeInsets.all(15),
              ),
              SizedBox(
                height: 30,
              ),
              LinkedInButtonStandardWidget(
                onTap: () {
                  setState(() {
                    user = null;
                    logoutUser = true;
                    Navigator.pop(context);
                  });
                },
                buttonText: 'Logout',
                iconHeight: 40,
                iconWeight: 40,
                textPadding: EdgeInsets.all(15),
              ),
            ]),
      ),
    );
  }
}
