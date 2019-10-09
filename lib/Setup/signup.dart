import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_firebase_auth/Setup/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email,_password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),

      body: Container(
        padding: EdgeInsets.all(14.0),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return 'Provide an email';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                  onSaved: (input) => _email = input,
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                TextFormField(
                  validator:  (input) {
                    if(input.length < 6){
                      return 'Longer password please';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  onSaved: (input) => _password = input,
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                RaisedButton(
                  onPressed: (){
                    signUp();
                  },
                  child: Text("Sign Up"),
                )
              ],
            )
        ),
      ),
    );
  }

  Future signUp() async {
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      try{
        FirebaseAuth auth = FirebaseAuth.instance;
        AuthResult result = await auth.createUserWithEmailAndPassword(email: _email, password: _password);
        result.user.sendEmailVerification();
        
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}
