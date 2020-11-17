import 'package:flutter/material.dart';

class Display_Screen {
  displayUserData(profileData) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text("Facebook"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      profileData['picture']['data']['url'],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Text(profileData['name'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico')),
              Text("FBID ${profileData['id']}",
                  style: TextStyle(
                      color: Colors.teal.shade100,
                      fontSize: 20.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail_outline,
                      size: 30.0,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      profileData['email'],
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Text(
// "FBID ${profileData['id']}\n${profileData['name']}\n${profileData['email']}",
// style: TextStyle(
// fontSize: 20.0,
// letterSpacing: 1.1,
// ),
// textAlign: TextAlign.center,
// ),
