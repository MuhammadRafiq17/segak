import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segak/component/exam_widget/tahniah_join.dart';
import 'package:segak/component/widget.dart';
import 'package:segak/screen/guru/tahniah_kelas.dart';
import 'package:segak/services/auth.dart';
import 'package:segak/services/database.dart';
import 'package:segak/utils/helper.dart';

class SertaiKelasScreen extends StatefulWidget {
  SertaiKelasScreen({super.key});

  @override
  State<SertaiKelasScreen> createState() => _SertaiKelasScreenState();
}

class _SertaiKelasScreenState extends State<SertaiKelasScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;

  String kelas = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Sertai Kelas',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.class_outlined),
              //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      const Text(
                        'Sertai Kelas!',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Masukkan Kelas ID',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top:
                                              20), // add padding to adjust text
                                      isDense: true,
                                      hintText: "Kelas ID",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child: Icon(
                                            Icons.confirmation_number_outlined),
                                      ),
                                    ),
                                    onChanged: (val) {
                                      setState(() => kelas = val);
                                    }),
                              ), // Kelas ID
                              const SizedBox(height: 20.0),

                              const SizedBox(height: 20.0),

                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      "Sertai".toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    var userFirebase =
                                        FirebaseAuth.instance.currentUser;
                                    await UserDatabaseService(
                                            uid: userFirebase!.uid)
                                        .joinClass(kelas);
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TahniahJoinKelas(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
