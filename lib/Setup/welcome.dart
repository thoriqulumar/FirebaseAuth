import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/Setup/login.dart';
import 'package:flutter_firebase_auth/Setup/signup.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase App"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              NavigatetSignIn();
            },
            child: Text("Sign In"),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          RaisedButton(
            onPressed: (){
              NavigatetSignUp();
            },
            child: Text("Sign Up"),
          )
        ],
      ),
    );
  }

  void NavigatetSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(),fullscreenDialog: true));
  }

  void NavigatetSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(),fullscreenDialog: true));
  }
}
