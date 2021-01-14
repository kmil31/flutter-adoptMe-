import 'package:adoptmeh/models/user.dart';
import 'package:adoptmeh/screens/authenticate/authenticate.dart';
import 'package:adoptmeh/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This wrapper widget will return either home or Authenticate
    // Depending on the authentication state
    final currentUser = Provider.of<UserModel>(context);

    if (currentUser == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
