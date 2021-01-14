import 'package:adoptmeh/services/auth.dart';
import 'package:adoptmeh/shared/constants.dart';
import 'package:adoptmeh/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String email = '';
  String password = '';
  String name = '';
  String error = '';
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text("Register to Adopt Me!"),
              backgroundColor: Color(0xff455a64),
              actions: <Widget>[
                FlatButton.icon(
                  color: Color(0xfffdd835),
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blueGrey, Colors.lightBlueAccent]),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(height: 80.0),
                        Image.asset('assets/fox.png'),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              textboxdecoration.copyWith(hintText: "Email"),
                          validator: (value) =>
                              value.isEmpty ? 'Enter an email' : null,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              textboxdecoration.copyWith(hintText: "Password"),
                          obscureText: true,
                          validator: (value) => value.length < 6
                              ? 'Password must be 6 digits minimum'
                              : null,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration:
                              textboxdecoration.copyWith(hintText: "Your Name"),
                          obscureText: true,
                          validator: (value) =>
                              value.isEmpty ? 'Enter Your Name' : null,
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                        RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              
                              dynamic result =
                                  await _auth.registerEmailPW(email, password);

                                  await userCollection.add({
                                    'name': name,
                                    'uid': result.uid,
                                    });
                              if (result == null) {
                                setState(() =>
                                    error = 'Please supply a valid email');

                                setState(() => loading = false);
                              } else {
                                Navigator.pop(context);

                                // if it returns a user object, pop the register screen

                                // so that the original screen redraws.

                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
