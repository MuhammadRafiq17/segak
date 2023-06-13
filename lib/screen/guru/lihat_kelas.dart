import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segak/component/widget.dart';
import 'package:segak/utils/styles.dart';

class LihatKelas extends StatefulWidget {
  const LihatKelas({super.key});

  @override
  State<LihatKelas> createState() => _LihatKelasState();
}

class _LihatKelasState extends State<LihatKelas> {
  //String? id = "";
  List<String> id = [];

  List<String> namakelas = [];
  String? username = "";
  int bilKelas = 0;
  //String? namakelas = "";
  String? isExist;
  final double _headerHeight = 200;
  Future<void> getKelasData() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;

    //  final querySnapshot = await FirebaseFirestore.instance
    //     .collection('distanceHistory')
    //     .doc(userFirebase!.uid)
    //     .collection('distance')
    //     .get();
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Kelas')
        .doc(userFirebase!.uid)
        .collection('listKelas')
        .get();

    bilKelas = querySnapshot.docs.length;
    if (bilKelas != 0) {
      // await FirebaseFirestore.instance
      //     .collection('Kelas')
      //     .doc(userFirebase.uid)
      //     .collection('listKelas')
      //     .doc('0')
      //     .get()
      //     .then((DocumentSnapshot documentSnapshot2) async {
      //   if (documentSnapshot2.exists) {
      //     setState(() {
      //       namakelas = documentSnapshot2.get('NameKelas').toString();
      //       id = documentSnapshot2.get('IDKelas').toString();
      //       isExist = "true";
      //     });
      //   }
      // });
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        FirebaseFirestore.instance
            .collection('Kelas')
            .doc(userFirebase.uid)
            .collection('listKelas')
            .doc(i.toString())
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
                // child: Padding(
                //   padding:
                //       EdgeInsets.only(left: medium, top: 50, right: medium),
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
                                onPressed: () {});
                            // return Card(
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(15.0),
                            //     child: Text(
                            //       'Distance: ${id[position]} ${namakelas[position]} KM',
                            //     ),
                            //   ),
                            // );
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
    //return Scaffold(
    //   appBar: AppBar(
    //       backgroundColor: Colors.green[900],
    //       iconTheme: const IconThemeData(color: Colors.white),
    //       title: const Text(
    //         'Kelas',
    //         style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    //       )),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: _headerHeight,
    //           child: HeaderWidget(_headerHeight, true, Icons.person),
    //           //let's create a common header widget
    //         ),
    //         SafeArea(
    //           child: Container(
    //             padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    //             margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    //             child: Column(
    //               children: [
    //                 const Text(
    //                   'KELAS',
    //                   textAlign: TextAlign.center,
    //                   style:
    //                       TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    //                 ),
    //                 const Text(
    //                   'Sila Berikan Kelas ID Kepada Pelajar Anda!',
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(color: Colors.grey),
    //                 ),
    //                 const SizedBox(height: 10.0),
    //                 Container(
    //                   child: Padding(
    //                     padding: EdgeInsets.only(
    //                         left: xsmall, top: 10, right: medium),
    //                     child: Column(
    //                       children: [
    //                         // Text(
    //                         //   "NAMA: ${username!}",
    //                         //   textAlign: TextAlign.center,
    //                         //   style: const TextStyle(
    //                         //       fontSize: 20, fontWeight: FontWeight.bold),
    //                         // ),
    //                         // Text(
    //                         //   "NAMA KELAS: ${namakelas!}",
    //                         //   textAlign: TextAlign.center,
    //                         //   style: const TextStyle(
    //                         //       fontSize: 20, fontWeight: FontWeight.bold),
    //                         // ),
    //                         // Text(
    //                         //   "KELAS ID: ${id!}",
    //                         //   textAlign: TextAlign.center,
    //                         //   style: const TextStyle(
    //                         //       fontSize: 20, fontWeight: FontWeight.bold),
    //                         // ),
    //                         // const SizedBox(height: 20.0),

    //                         // Text("Test")
    //                         Expanded(
    //                           child: ListView.separated(
    //                             itemBuilder: (context, position) {
    //                               return Card(
    //                                 child: Padding(
    //                                   padding: const EdgeInsets.all(15.0),
    //                                   child: Text(
    //                                     'Distance: ${id[position]} KM ${namakelas[position]}',
    //                                   ),
    //                                 ),
    //                               );
    //                             },
    //                             separatorBuilder: (context, position) {
    //                               return const Card(
    //                                 color: Colors.grey,
    //                                 child: Padding(
    //                                   padding: EdgeInsets.all(5.0),
    //                                   child: Text(
    //                                     '',
    //                                     style: TextStyle(color: Colors.white),
    //                                   ),
    //                                 ),
    //                               );
    //                             },
    //                             itemCount: id.length,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 30.0),
    //                 // Container(
    //                 //   decoration:
    //                 //       ThemeHelper().buttonBoxDecoration(context),
    //                 //   child: ElevatedButton(
    //                 //       style: ThemeHelper().buttonStyle(),
    //                 //       child: Padding(
    //                 //         padding: const EdgeInsets.fromLTRB(
    //                 //             40, 10, 40, 10),
    //                 //         child: Text(
    //                 //           'Selesai'.toUpperCase(),
    //                 //           style: const TextStyle(
    //                 //               fontSize: 20,
    //                 //               fontWeight: FontWeight.bold,
    //                 //               color: Colors.white),
    //                 //         ),
    //                 //       ),
    //                 //       onPressed: () async {
    //                 //         Navigator.pushReplacement(
    //                 //           context,
    //                 //           MaterialPageRoute(
    //                 //             builder: (context) => BottomNav(),
    //                 //           ),
    //                 //         );
    //                 //       }),
    //                 // ),
    //                 // const SizedBox(height: 30.0),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    // }
  }
}
