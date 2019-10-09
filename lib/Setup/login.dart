import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_firebase_auth/home.dart';


class LoginPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<LoginPage> {
  String _email,_password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),

      body: Container(
        padding: EdgeInsets.all(14.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return 'Provide an email';
                    }
                  },
                  onSaved: (input)=> _email = input,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                TextFormField(
                  validator: (input){
                    if(input.length < 6){
                      return 'Longer password please';
                    }
                  },
                  onSaved: (input)=> _password = input,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),

                Padding(padding: EdgeInsets.all(10.0)),
                
                RaisedButton(
                    onPressed: (){
                      signIn();
                    },
                    child: Text("Sign In"),
                )
              ],
            )
        ),
      ),
    );
  }

  Future signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        final FirebaseAuth auth = FirebaseAuth.instance;
        AuthResult result = await auth.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(result: result,)));
      }catch(e){
        print(e.message);
      }

    }
  }
}