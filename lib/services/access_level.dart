import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:segak/screen/authenticate/sign_in.dart';
import 'package:segak/screen/guru/guruscreen.dart';
import 'package:segak/wrapper.dart';
import '../component/bottom_nav.dart';
import 'package:segak/utils/styles.dart';

class AccessLevel extends StatefulWidget {
  const AccessLevel({super.key});

  @override
  State<AccessLevel> createState() => _MyAppState();
}

class _MyAppState extends State<AccessLevel> {
  @override
  Widget build(BuildContext context) {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('usertype') == "Pelajar") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNav()),
          );
        } else if (documentSnapshot.get('usertype') == "Guru") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Guru()),
          );
        }
      } else {
        return const Wrapper();
      }
    });
    return const Center(child: CircularProgressIndicator());
  }
}
