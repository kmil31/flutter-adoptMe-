import 'package:adoptmeh/services/auth.dart';
import 'package:adoptmeh/shared/constants.dart';
import 'package:adoptmeh/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
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
              backgroundColor: Colors.teal[400],
              actions: <Widget>[
                FlatButton.icon(
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
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 80.0),
                    Image.asset('assets/fox.png'),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textboxdecoration.copyWith(hintText: "Email"),
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

                          if (result == null) {
                            setState(
                                () => error = 'Please supply a valid email');
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
              ),
            ),
          );
  }
}
