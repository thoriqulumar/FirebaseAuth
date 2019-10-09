import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Home extends StatelessWidget {
  const Home({Key key,@required this.result}) : super(key: key);
  final AuthResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome ${result.user.email}"),
        ),

        body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance.collection('users').document(result.user.uid).snapshots(),
          builder: (BuildContext context,AsyncSnapshot<DocumentSnapshot> snapshot){
            if(snapshot.hasError){
              return Text("Error : ${snapshot.error}");
            }

            switch(snapshot.connectionState){

              case ConnectionState.waiting:
                return Text("Loading...");
              default:
                return Text(snapshot.data['name']);
            }

          },
        )
    );
  }
}

