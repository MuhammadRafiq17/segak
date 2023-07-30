import 'package:flutter/material.dart';
import 'package:segak/component/bottom_nav.dart';
import 'package:segak/screen/guru/guruscreen.dart';
import 'package:segak/screen/guru/lihat_kelas.dart';
import 'package:segak/screen/profile_screen.dart';
import 'package:segak/utils/helper.dart';

class TahniahJoinKelas extends StatefulWidget {
  const TahniahJoinKelas({super.key});

  @override
  State<TahniahJoinKelas> createState() => _TahniahJoinKelasState();
}

class _TahniahJoinKelasState extends State<TahniahJoinKelas> {
  final double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 160.0),
                      const Text(
                        'Tahniah Anda Telah Menyertai Kelas!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
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
                                'Selesai'.toUpperCase(),
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
                                  builder: (context) => BottomNav(),
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
