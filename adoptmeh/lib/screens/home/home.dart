import 'package:adoptmeh/services/auth.dart';
import 'package:adoptmeh/services/firestoreoperations.dart';
import 'package:flutter/material.dart';
import 'package:adoptmeh/models/animal.dart';
import 'package:adoptmeh/services/database.dart';
import 'package:provider/provider.dart';
import 'animal_list.dart';
import 'createadoption.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  Adopt _adopt = Adopt();

  String username = "";

  _HomeState() {
    _adopt.getNameFromFirestore().then((val) => setState(() {
          username = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Animal>>.value(
      value: DatabaseService().animals,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Hello $username!"),
          backgroundColor: Color(0xff455a64),
          elevation: 5.0,
          actions: <Widget>[
            FlatButton(
              child: Text("Create an Adoption"),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => createAdoption(),
                    ));
              },
            ),
            FlatButton.icon(
              color: Color(0xfffdd835),
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
