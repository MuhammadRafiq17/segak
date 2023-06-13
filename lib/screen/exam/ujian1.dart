import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segak/screen/exam/tahniah.dart';
import 'package:segak/screen/exam/ujian1_bmi.dart';

import '../../component/widget.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../../utils/helper.dart';

class Ujian1BMI extends StatefulWidget {
  Ujian1BMI({super.key});

  @override
  State<Ujian1BMI> createState() => _Ujian1BMIState();
}

class _Ujian1BMIState extends State<Ujian1BMI> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;
  double weight = 0.0;
  double height = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Ujian 1',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child:
                  HeaderWidget(_headerHeight, true, Icons.looks_one_outlined),
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
                        'Ujian 1!',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Masukkan Berat & Tinggi Anda',
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
                                      hintText: "Berat (KG)",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child:
                                            Icon(Icons.monitor_weight_outlined),
                                      ),
                                    ),
                                    // decoration: ThemeHelper().textInputDecoration(
                                    //     'Username', 'Enter your username'),
                                    keyboardType: TextInputType.phone,
                                    onChanged: (val) {
                                      setState(
                                          () => weight = double.parse(val));
                                    }),
                              ), // Berat
                              const SizedBox(height: 20.0),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top:
                                              20), // add padding to adjust text
                                      isDense: true,
                                      hintText: "Tinggi (CM)",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child: Icon(Icons.height_outlined),
                                      ),
                                    ),
                                    // decoration: ThemeHelper().textInputDecoration(
                                    //     'Username', 'Enter your username'),
                                    keyboardType: TextInputType.phone,
                                    onChanged: (val) {
                                      setState(
                                          () => height = double.parse(val));
                                    }),
                              ), // Tinggi
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
                                    if (weight != 0 && height != 0) {
                                      var userFirebase =
                                          FirebaseAuth.instance.currentUser;
                                      await UserDatabaseService(
                                              uid: userFirebase!.uid)
                                          .updateExam1(weight, height);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TahniahScreen(),
                                        ),
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Mauskkan Berat & Tinggi ",
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
      // body: Image.asset(
      //   'assets/images/segak.jpg',
      //   height: 500,
      //   width: 2000,
      // ),
    );
  }
}
