import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segak/component/widget.dart';
import 'package:segak/screen/exam_screen.dart';
import 'package:segak/utils/helper.dart';
import 'package:segak/utils/styles.dart';

import '../../component/bottom_nav.dart';

class LihatNaik extends StatefulWidget {
  const LihatNaik({super.key});

  @override
  State<LihatNaik> createState() => _LihatNaikState();
}

class _LihatNaikState extends State<LihatNaik> {
  String? nadi = "";
  String? age = "";
  String? score = "";
  String isExist = "";
  final double _headerHeight = 200;

  Future<void> getUserData() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = await FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        age = documentSnapshot.get('age').toString();

        await FirebaseFirestore.instance
            .collection('exam2')
            .doc(userFirebase.uid + age!)
            .collection(userFirebase.uid)
            .doc('Penggal_2')
            .get()
            .then((DocumentSnapshot documentSnapshot2) async {
          if (documentSnapshot2.exists) {
            nadi = documentSnapshot2.get('nadi').toString();
            score = documentSnapshot2.get('score').toString();

            setState(() {
              // nadi = nadi;
              // score = score;
              // age = age;
              isExist = "true";
            });
          } else {
            await FirebaseFirestore.instance
                .collection('exam2')
                .doc(userFirebase.uid + age!)
                .collection(userFirebase.uid)
                .doc('Penggal_1')
                .get()
                .then((DocumentSnapshot documentSnapshot3) async {
              if (documentSnapshot3.exists) {
                nadi = documentSnapshot3.get('nadi').toString();
                score = documentSnapshot3.get('score').toString();

                setState(() {
                  // bmi = bmi;
                  // score = score;
                  // age = age;
                  isExist = "true";
                });
              }
            });
          }
        });
      }
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    if (isExist == "") {
      return const Center(child: Text("Tahniah"));
    } else if (isExist == "false") {
      return isExist == ""
          ? const Center(child: Text("Tahniah"))
          : Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.green[900],
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: const Text(
                    'Kadar Denyutan Nadi (Seminit)',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: _headerHeight,
                      child: HeaderWidget(_headerHeight, true, Icons.person),
                      //let's create a common header widget
                    ),
                    SafeArea(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          children: [
                            const Text(
                              'Kadar Denyutan Nadi (Seminit)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Denyutan Nadi dan Skor Anda',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: xsmall, top: 10, right: medium),
                                child: Column(
                                  children: [
                                    Text(
                                      "UMUR: ${age!} Tahun",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "DENYUTAN NADI: ${nadi!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "SKOR: ${score!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Text("Test")
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      'Selasai'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomNav(),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    } else {
      return isExist == ""
          ? const Center(child: Text("Tahniah"))
          : Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.green[900],
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: const Text(
                    'Kadar Denyutan Nadi (Seminit)',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: _headerHeight,
                      child: HeaderWidget(_headerHeight, true, Icons.person),
                      //let's create a common header widget
                    ),
                    SafeArea(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          children: [
                            const Text(
                              'Kadar Denyutan Nadi (Seminit)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Denyutan Nadi dan Skor Anda',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: xsmall, top: 10, right: medium),
                                child: Column(
                                  children: [
                                    Text(
                                      "UMUR: ${age!} Tahun",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "DENYUTAN NADI: ${nadi!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "SKOR: ${score!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Text("Test")
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      'Selasai'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomNav(),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    }
  }
}
