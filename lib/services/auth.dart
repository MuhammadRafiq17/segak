import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:flutter/foundation.dart' as Foundation;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/user_models.dart';

import 'package:segak/services/database.dart';
import '../screen/authenticate/verify_email.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   UserData? _userFromFirebaseUser(User? user) {
//     return user != null ? UserData(uid: user.uid) : null;
//   }

//   // auth change user stream
//   Stream<UserData?> get user {
//     return _auth
//         .authStateChanges()
//         //.map((User? user) => _userFromFirebaseUser(user));
//         .map(_userFromFirebaseUser);
//   }

//   // sign in anon
//   Future signInAnon() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User? user = result.user;
//       if (Foundation.kDebugMode) {
//         print("TEST DEBUG MODE KE TAK");
//       }
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       if (Foundation.kDebugMode) {
//         print(e.toString());
//       }
//       return null;
//     }
//   }

//   // sign in email pass
//   Future signInEmailPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       User? user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // register email pass
//   Future signUpEmailPassword(
//       String email, String username, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = result.user;
//       //var userFirebase = _auth.currentUser;
//       // int role = 1;
//       // CollectionReference ref = FirebaseFirestore.instance.collection('users');
//       // ref.doc(userFirebase!.uid).set({'email': email, 'role': role});
//       await DatabaseService(uid: user!.uid)
//           .updateUserData(email, username, password, 'beginner', 1);
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // signout
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   void addPlayerAccount(String email, String username, String password) async {
//     try {
//       _auth.createUserWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(
      String email,
      String password,
      String username,
      String phoneNo,
      String age,
      String gender,
      String usertype,
      BuildContext context) async {
    try {
      dynamic value = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserDatabaseService(uid: value.user!.uid)
          .setuserdata(username, email, phoneNo, gender, age, usertype);
      Fluttertoast.showToast(
          msg: "Successfully signed up",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 20.0,
          backgroundColor: Colors.transparent,
          textColor: Colors.green);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const VerifyEmail()));
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.transparent,
          textColor: Colors.red);
    }
  }

  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Fluttertoast.showToast(
          msg: "Signed in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 20.0,
          backgroundColor: Colors.transparent,
          textColor: Colors.green);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.transparent,
          textColor: Colors.red);
    }
  }

  Future SignOut() async {
    try {
      await _auth.signOut();
      Fluttertoast.showToast(
          msg: "Signed out successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 20.0,
          backgroundColor: Colors.transparent,
          textColor: Colors.green);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.transparent,
          textColor: Colors.red);
    }
  }

  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
          msg: "Email sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 20.0,
          backgroundColor: Colors.transparent,
          textColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.transparent,
          textColor: Colors.red);
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      Fluttertoast.showToast(
          msg: "Email sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 20.0,
          backgroundColor: Colors.transparent,
          textColor: Colors.green);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.transparent,
          textColor: Colors.red);
    }
  }
}
