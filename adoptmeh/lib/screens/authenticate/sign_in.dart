import 'package:adoptmeh/screens/authenticate/register.dart';
import 'package:adoptmeh/services/auth.dart';
import 'package:adoptmeh/shared/constants.dart';
import 'package:adoptmeh/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field states
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            // load screen if true, else return scaffold
            appBar: AppBar(
              title: Text("Sign in to Adopt Me!"),
              backgroundColor: Colors.teal[400],
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
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
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);

                          dynamic result =
                              await _auth.signInEmailPW(email, password);
                          if (result == null) {
                            setState(() => loading = false);
                            setState(() => error = "Error Signing In");
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
