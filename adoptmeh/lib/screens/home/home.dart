import 'package:adoptmeh/services/auth.dart';
import 'package:adoptmeh/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adoptmeh/models/animal.dart';
import 'package:adoptmeh/services/database.dart';
import 'package:provider/provider.dart';
import 'animal_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Animal>>.value(
      value: DatabaseService().animals,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Adopt Me!"),
          backgroundColor: Colors.brown[300],
          elevation: 5.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: AnimalList(),
      ),
    );
  }
}
