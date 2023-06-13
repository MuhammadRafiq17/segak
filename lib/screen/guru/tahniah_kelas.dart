import 'package:flutter/material.dart';
import 'package:segak/screen/guru/guruscreen.dart';
import 'package:segak/screen/guru/lihat_kelas.dart';
import 'package:segak/utils/helper.dart';

class TahniahCiptaKelas extends StatefulWidget {
  const TahniahCiptaKelas({super.key});

  @override
  State<TahniahCiptaKelas> createState() => _TahniahCiptaKelasState();
}

class _TahniahCiptaKelasState extends State<TahniahCiptaKelas> {
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
                        'Tahniah Kelas Sudah Di Cipta!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sila Lihat Kelas Anda',
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
                                  builder: (context) => Guru(),
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
