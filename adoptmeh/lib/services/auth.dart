import 'package:adoptmeh/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// This file handles all authenticate services in one place.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  //create a function that stores a userobject uid.

  UserModel _userFromFirebase(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  String getuid() {
    final User user = _auth.currentUser;
    final uid = user.uid;
    return uid.toString();
  }



  //authchange user stream
  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  } // each time stream sends an object, map it to our model class.

  //sign in anonymously method
  Future anonSignIn() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      // ^ gets a usercredential object, which is a user object with all properties
      User userObject = result.user;

      // ^assigns a specific property to a variable of type User.
      return _userFromFirebase(userObject);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInEmailPW(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e);
    }
  }

  //register with email and password
  Future registerEmailPW(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e);
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
