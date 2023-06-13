import 'package:flutter/material.dart';
import 'package:segak/screen/exam/lihat_skor.dart';
import 'package:segak/screen/exam/penggal_2/skor_p2.dart';
import 'package:segak/utils/helper.dart';
import 'package:segak/utils/styles.dart';

class ProfilLihatSkorScreen extends StatefulWidget {
  const ProfilLihatSkorScreen({super.key});

  @override
  State<ProfilLihatSkorScreen> createState() => _ProfilLihatSkorScreenState();
}

class _ProfilLihatSkorScreenState extends State<ProfilLihatSkorScreen> {
  final double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Lihat Skor',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 180.0),
                    Text(
                      'Lihat Skor Anda!',
                      textAlign: TextAlign.center,
                      style: heading1,
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              'PENGGAL 1'.toUpperCase(),
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
                                builder: (context) => LihatSkorScreen(),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              'PENGGAL 2'.toUpperCase(),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
