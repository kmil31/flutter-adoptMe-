import 'package:adoptmeh/models/user.dart';
import 'package:adoptmeh/screens/wrapper.dart';
import 'package:adoptmeh/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase
      .initializeApp(); // This starts a firebase connection. IMPORTANT!
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.quicksandTextTheme(
            Theme.of(context).textTheme,
          ),
        ),

        title: "Hello",
        home: Wrapper(), //calls wrapper to authenticate session
      ),
    );
  }
}
