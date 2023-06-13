import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segak/component/bottom_nav.dart';
import 'package:segak/component/widget.dart';
import 'package:segak/utils/helper.dart';
import 'package:segak/utils/styles.dart';

class LihatSkorScreenPen2 extends StatefulWidget {
  const LihatSkorScreenPen2({super.key});

  @override
  State<LihatSkorScreenPen2> createState() => _LihatSkorScreenPen2State();
}

class _LihatSkorScreenPen2State extends State<LihatSkorScreenPen2> {
  String? bmi = "";
  String? username = "";
  String? gender = "";
  String? age = "";
  String? score = "";
  String? nadi = "";
  String? score2 = "";
  String? tekan = "";
  String? score3 = "";
  String? ringkuk = "";
  String? score4 = "";
  String? jarak = "";
  String? score5 = "";
  String isExist = "";
  String? gred = "";
  String? bintang = "";
  String? status = "";
  int totalscore = 0;
  final double _headerHeight = 200;

  Future<void> getUserData() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = await FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        username = documentSnapshot.get('name').toString();
        gender = documentSnapshot.get('gender').toString();
        age = documentSnapshot.get('age').toString();

        await FirebaseFirestore.instance
            .collection('exam1')
            .doc(userFirebase.uid + age!)
            .collection(userFirebase.uid)
            .doc('Penggal_2')
            .get()
            .then((DocumentSnapshot documentSnapshot2) async {
          if (documentSnapshot2.exists) {
            setState(() {
              bmi = documentSnapshot2.get('bmi').toString();
              score = documentSnapshot2.get('score').toString();
              isExist = "true";
            });
          }
        });
      }
    });
  }

  Future<void> getUserData2() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = await FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        username = documentSnapshot.get('name').toString();
        gender = documentSnapshot.get('gender').toString();
        age = documentSnapshot.get('age').toString();

        await FirebaseFirestore.instance
            .collection('exam2')
            .doc(userFirebase.uid + age!)
            .collection(userFirebase.uid)
            .doc('Penggal_2')
            .get()
            .then((DocumentSnapshot documentSnapshot2) async {
          if (documentSnapshot2.exists) {
            setState(() {
              nadi = documentSnapshot2.get('nadi').toString();
              score2 = documentSnapshot2.get('score').toString();
            });
          }
        });
      }
    });
  }

  Future<void> getUserData3() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = await FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        username = documentSnapshot.get('name').toString();
        gender = documentSnapshot.get('gender').toString();
        age = documentSnapshot.get('age').toString();

        await FirebaseFirestore.instance
            .collection('exam3')
            .doc(userFirebase.uid + age!)
            .collection(userFirebase.uid)
            .doc('Penggal_2')
            .get()
            .then((DocumentSnapshot documentSnapshot2) async {
          if (documentSnapshot2.exists) {
            setState(() {
              tekan = documentSnapshot2.get('tekan').toString();
              score3 = documentSnapshot2.get('score').toString();
            });
          }
        });
      }
    });
  }

  Future<void> getUserData4() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = await FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        username = documentSnapshot.get('name').toString();
        gender = documentSnapshot.get('gender').toString();
        age = documentSnapshot.get('age').toString();

        await FirebaseFirestore.instance
            .collection('exam4')
            .doc(userFirebase.uid + age!)
            .collection(userFirebase.uid)
            .doc('Penggal_2')
            .get()
            .then((DocumentSnapshot documentSnapshot2) async {
          if (documentSnapshot2.exists) {
            setState(() {
              ringkuk = documentSnapshot2.get('ringkuk').toString();
              score4 = documentSnapshot2.get('score').toString();
            });
          }
        });
      }
    });
  }

  Future<void> getUserData5() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = await FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        username = documentSnapshot.get('name').toString();
        gender = documentSnapshot.get('gender').toString();
        age = documentSnapshot.get('age').toString();

        await FirebaseFirestore.instance
            .collection('exam5')
            .doc(userFirebase.uid + age!)
            .collection(userFirebase.uid)
            .doc('Penggal_2')
            .get()
            .then((DocumentSnapshot documentSnapshot2) async {
          if (documentSnapshot2.exists) {
            setState(() {
              jarak = documentSnapshot2.get('jarak').toString();
              score5 = documentSnapshot2.get('score').toString();
            });
          }
        });
      }
    });
  }

  Future<void> calScore() async {
    totalscore = int.parse(score2!) +
        int.parse(score3!) +
        int.parse(score4!) +
        int.parse(score5!);
    if (totalscore <= 20 && totalscore >= 18) {
      gred = "A";
      bintang = "5 Bintang";
      status = "Kecergasan Sangat Tinggi";
    } else if (totalscore <= 17 && totalscore >= 15) {
      gred = "B";
      bintang = "4 Bintang";
      status = "Kecergasan Tinggi";
    } else if (totalscore <= 14 && totalscore >= 12) {
      gred = "C";
      bintang = "3 Bintang";
      status = "Cergas";
    } else if (totalscore <= 11 && totalscore >= 8) {
      gred = "D";
      bintang = "2 Bintang";
      status = "Kurang Cergas";
    } else if (totalscore <= 7 && totalscore >= 4) {
      gred = "E";
      bintang = "1 Bintang";
      status = "Tidak Cergas";
    } else {
      gred = "F";
      bintang = "Tiada Bintang";
      status = "Tidak Melengkapkan Ujian Segak";
    }
  }

  @override
  void initState() {
    getUserData();
    getUserData2();
    getUserData3();
    getUserData4();
    getUserData5();
    calScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    calScore();
    if (isExist == "") {
      return const Center(child: Text("Tahniah"));
    } else {
      return isExist == ""
          ? const Center(child: Text("Tahniah"))
          : Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.green[900],
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: const Text(
                    'Skor Ujian',
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
                              'SKOR UJIAN SEGAK',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Tahniah!',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Text(
                              'Penggal 2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: xsmall, top: 10, right: medium),
                                child: Column(
                                  children: [
                                    Text(
                                      "NAMA: ${username!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "JANTINA: ${gender!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "UMUR: ${age!} Tahun",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      "INDEKS JISIM BADAN",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "BMI: ${bmi!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "SKOR: ${score!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      "KADAR DENYUTAN NADI (SEMINIT)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "DENYUTAN NADI: ${nadi!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "SKOR: ${score2!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      "BILANGAN TEKAN TUBI",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "BILANGAN: ${tekan!} Ulangan",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "SKOR: ${score3!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      "BILANGAN RINGKUK TUBI SEPARA",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "BILANGAN: ${ringkuk!} Ulangan",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "SKOR: ${score4!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      "JARAK JANGKAUAN MELUNJUR",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "JARAK: ${jarak!} CM",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "SKOR: ${score5!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      "KEPUTUSAN KESELURUHAN UJIAN SEGAK",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "JUMLAH SKOR: ${totalscore.toString()}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "GRED: ${gred!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "JUMLAH BINTANG: ${bintang!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "STATUS KECERGASAN: ${status!}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
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
                                      'Selesai'.toUpperCase(),
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
