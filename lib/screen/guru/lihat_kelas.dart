import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segak/component/widget.dart';
import 'package:segak/screen/guru/tunjuk_kelas.dart';
import 'package:segak/utils/styles.dart';

class LihatKelas extends StatefulWidget {
  const LihatKelas({super.key});

  @override
  State<LihatKelas> createState() => _LihatKelasState();
}

class _LihatKelasState extends State<LihatKelas> {
  List<String> id = [];
  String kelasHantar = "";
  List<String> namakelas = [];
  String? username = "";
  int bilKelas = 0;
  String? isExist;
  final double _headerHeight = 200;
  Future<void> getKelasData() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Kelas')
        .doc(userFirebase!.uid)
        .collection('listKelas')
        .get();

    bilKelas = querySnapshot.docs.length;
    if (bilKelas != 0) {
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        String halfkelasID = '0';
        if (i < querySnapshot.docs.length) {
          halfkelasID = halfkelasID + i.toString();
        } else {
          halfkelasID = querySnapshot.docs.length.toString();
        }
        FirebaseFirestore.instance
            .collection('Kelas')
            .doc(userFirebase.uid)
            .collection('listKelas')
            .doc(userFirebase.uid.substring(0, 3) + halfkelasID.toString())
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            namakelas.add(documentSnapshot.get('NameKelas').toString());
            id.add(documentSnapshot.get('IDKelas').toString());

            setState(() {
              isExist = "Not null";
            });
          } else {
            isExist = "";
          }
        });
      }
    }
  }

  @override
  void initState() {
    getKelasData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getKelasData();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Kelas Anda',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )),
        body: isExist == null
            ? const Center(child: Text("Loading"))
            : SafeArea(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: _headerHeight,
                      child: HeaderWidget(
                          _headerHeight, true, Icons.class_outlined),
                      //let's create a common header widget
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Senarai Kelas Anda",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Sila Berikan Kelas ID Kepada Pelajar',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: medium, top: 30, right: medium),
                        child: ListView.separated(
                          itemCount: id.length,
                          itemBuilder: (context, position) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 35, 101, 37),
                                  textStyle: TextStyle(fontSize: 20),
                                  minimumSize: Size.fromHeight(50),
                                ),
                                child: Text(
                                  'Nama Kelas: ${namakelas[position]} \nKelas ID: ${id[position]}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TunjukKelas(
                                              kelasHantar:
                                                  id[position].toString())));
                                });
                          },
                          separatorBuilder: (context, position) {
                            return const Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  '',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
              ));
  }
}
