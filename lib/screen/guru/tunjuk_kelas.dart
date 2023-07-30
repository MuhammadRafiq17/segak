import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TunjukKelas extends StatefulWidget {
  const TunjukKelas({
    Key? key,
    required this.kelasHantar,
  }) : super(key: key);
  final String kelasHantar;
  @override
  State<TunjukKelas> createState() => _TunjukKelasState();
}

class _TunjukKelasState extends State<TunjukKelas> {
  List<String> ageMurid = [];
  List<String> namaMurid = [];
  List<String> exam1Score = [];
  String? isExist;
  int bilMurid = 0;
  int bilmuridperkelas = 0;
  String idStudent = "";

  Future<void> getKelasData() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Kelas')
        .doc(userFirebase!.uid)
        .collection('listKelas')
        .get();

    bilMurid = querySnapshot.docs.length;
    final querySnapshot2 = await FirebaseFirestore.instance
        .collection('Kelas')
        .doc(userFirebase!.uid)
        .collection('listKelas')
        .get();

    bilmuridperkelas = querySnapshot2.docs.length;
    if (bilMurid != 0) {
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        String halfkelasID = '0';
        if (i < 10) {
          halfkelasID = halfkelasID + i.toString();
        } else {
          halfkelasID = querySnapshot.docs.length.toString();
        }
        print('testtt');
        var kk = FirebaseFirestore.instance
            .collection('Rujukan')
            .doc(widget.kelasHantar)
            .collection('listPelajar')
            .doc((bilmuridperkelas - 1).toString())
            .get()
            .then((DocumentSnapshot documentSnapshot) async {
          idStudent = documentSnapshot.get('uid').toString();
        });
        FirebaseFirestore.instance
            .collection('Kelas')
            .doc(userFirebase.uid)
            .collection('listKelas')
            .doc(userFirebase.uid.substring(0, 3) + halfkelasID.toString())
            .collection('Student')
            .doc(idStudent)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            namaMurid.add(documentSnapshot.get('name').toString());
            ageMurid.add(documentSnapshot.get('age').toString());
            FirebaseFirestore.instance
                .collection('exam1')
                .doc(idStudent + documentSnapshot.get('age').toString())
                .collection(idStudent)
                .doc('Penggal_1')
                .get()
                .then((DocumentSnapshot documentSnapshot2) async {
              exam1Score.add(documentSnapshot2.get('score').toString());
            });
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

  late CollectionReference<Map<String, dynamic>> ref;
  @override
  void initState() {
    super.initState();

    //getKelasData();
    ref = FirebaseFirestore.instance
        .collection('Kelas')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('listKelas')
        .doc(widget.kelasHantar)
        .collection('Student');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Kelas',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Card(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("PENGGAL 1"),
                                Text("BMI: " +
                                    snapshot.data!.docs[index]['scoreE1P1']),
                                Text("SKOR UJIAN 2: " +
                                    snapshot.data!.docs[index]['scoreE2P1']),
                                Text("SKOR UJIAN 3: " +
                                    snapshot.data!.docs[index]['scoreE3P1']),
                                Text("SKOR UJIAN 4: " +
                                    snapshot.data!.docs[index]['scoreE4P1']),
                                Text("SKOR UJIAN 5: " +
                                    snapshot.data!.docs[index]['scoreE5P1']),
                                if (snapshot.data!.docs[index]
                                            ['scoreE2P1'] !=
                                        "" &&
                                    snapshot.data!.docs[index]
                                            ['scoreE3P1'] !=
                                        "" &&
                                    snapshot.data!.docs[index]['scoreE4P1'] !=
                                        "" &&
                                    snapshot.data!.docs[index]['scoreE5P1'] !=
                                        "")
                                  Text(
                                      "JUMLAH SKOR: ${int.parse(snapshot.data!.docs[index]['scoreE2P1']) + int.parse(snapshot.data!.docs[index]['scoreE3P1']) + int.parse(snapshot.data!.docs[index]['scoreE4P1']) + int.parse(snapshot.data!.docs[index]['scoreE5P1'])}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("PENGGAL 2"),
                                Text("BMI: " +
                                    snapshot.data!.docs[index]['scoreE1P2']),
                                Text("SKOR UJIAN 2: " +
                                    snapshot.data!.docs[index]['scoreE2P2']),
                                Text("SKOR UJIAN 3: " +
                                    snapshot.data!.docs[index]['scoreE3P2']),
                                Text("SKOR UJIAN 4: " +
                                    snapshot.data!.docs[index]['scoreE4P2']),
                                Text("SKOR UJIAN 5: " +
                                    snapshot.data!.docs[index]['scoreE5P2']),
                                if (snapshot.data!.docs[index]
                                            ['scoreE2P2'] !=
                                        "" &&
                                    snapshot.data!.docs[index]
                                            ['scoreE3P2'] !=
                                        "" &&
                                    snapshot.data!.docs[index]['scoreE4P2'] !=
                                        "" &&
                                    snapshot.data!.docs[index]['scoreE5P2'] !=
                                        "")
                                  Text(
                                      "JUMLAH SKOR: ${int.parse(snapshot.data!.docs[index]['scoreE2P2']) + int.parse(snapshot.data!.docs[index]['scoreE3P2']) + int.parse(snapshot.data!.docs[index]['scoreE4P2']) + int.parse(snapshot.data!.docs[index]['scoreE5P2'])}"),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
