import 'package:flutter/material.dart';
import 'package:segak/screen/exam/lihat_skor.dart';
import 'package:segak/screen/exam/penggal_2/skor_p2.dart';
import 'package:segak/screen/exam/ujian1_bmi.dart';
import 'package:segak/utils/helper.dart';

class TahniahScreenPen2 extends StatefulWidget {
  const TahniahScreenPen2({super.key});

  @override
  State<TahniahScreenPen2> createState() => _TahniahScreenPen2State();
}

class _TahniahScreenPen2State extends State<TahniahScreenPen2> {
  final double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Colors.green[900],
      //     iconTheme: const IconThemeData(color: Colors.white),
      //     title: const Text(
      //       'Laman Ujian',
      //       style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      //     )),
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const SizedBox(height: 200.0),
                      const Text(
                        'Tahniah Anda Berjaya!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sila Lihat Skor Anda',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'LIHAT SKOR'.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LihatSkorScreenPen2(),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
