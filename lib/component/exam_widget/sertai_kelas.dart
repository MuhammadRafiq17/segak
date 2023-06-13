import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segak/component/widget.dart';
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
            // const Text(
            //   "EXAM",
            //   style: TextStyle(
            //     fontSize: 26,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
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
                                        top: 20), // add padding to adjust text
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
                                  // decoration: ThemeHelper().textInputDecoration(
                                  //     'Username', 'Enter your username'),
                                  // onChanged: (val) {
                                  //   setState(() => username = val);
                                  // }
                                  keyboardType: TextInputType.phone,
                                  // onChanged: (val) {
                                  //   setState(
                                  //       () => kelas = val);
                                  // }
                                ),
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
                                    // if (kelas != null) {
                                    //   var userFirebase =
                                    //       FirebaseAuth.instance.currentUser;
                                    //   await UserDatabaseService(
                                    //           uid: userFirebase!.uid)
                                    //       .updateExam5(jarakcm);
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => TahniahScreen(),
                                    //     ),
                                    //   );
                                    // } else {
                                    //   Fluttertoast.showToast(
                                    //       msg: "Mauskkan Jarak Melunjur ",
                                    //       toastLength: Toast.LENGTH_SHORT,
                                    //       gravity: ToastGravity.BOTTOM,
                                    //       fontSize: 20.0,
                                    //       backgroundColor: Colors.transparent,
                                    //       textColor: Colors.red);
                                    // }
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
      // body: Image.asset(
      //   'assets/images/segak.jpg',
      //   height: 500,
      //   width: 2000,
      // ),
    );
  }
}
