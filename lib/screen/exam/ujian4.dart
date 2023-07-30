import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segak/screen/exam/tahniah.dart';
import 'package:segak/screen/exam/ujian4_ringkuk.dart';
import 'package:segak/services/database.dart';
import '../../utils/helper.dart';
import '../../component/widget.dart';
import '../../services/auth.dart';

class Ujian4Ringkuk extends StatefulWidget {
  Ujian4Ringkuk({super.key});

  @override
  State<Ujian4Ringkuk> createState() => _Ujian4RingkukState();
}

class _Ujian4RingkukState extends State<Ujian4Ringkuk> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;

  int ringkuk = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Ujian 4',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.looks_4_outlined),
              //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      const Text(
                        'Ujian 4!',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Masukkan Bilangan Ringkuk Tubi Separa Anda',
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
                                      hintText:
                                          "Ringkuk Tubi Separa (Bilangan)",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child: Icon(Icons.numbers_outlined),
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    onChanged: (val) {
                                      setState(() => ringkuk = int.parse(val));
                                    }),
                              ), // Ringkuk tubi
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
                                      "Hantar".toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (ringkuk != 0) {
                                      var userFirebase =
                                          FirebaseAuth.instance.currentUser;
                                      await UserDatabaseService(
                                              uid: userFirebase!.uid)
                                          .updateExam4(ringkuk);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TahniahScreen(),
                                        ),
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Mauskkan Bilangan Ringkuk Tubi ",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          fontSize: 20.0,
                                          backgroundColor: Colors.transparent,
                                          textColor: Colors.red);
                                    }
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
