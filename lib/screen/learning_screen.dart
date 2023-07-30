import 'package:flutter/material.dart';
import 'package:segak/screen/learning/turutan1.dart';
import 'package:segak/screen/learning/turutan2.dart';
import 'package:segak/screen/learning/turutan3.dart';
import 'package:segak/screen/learning/turutan4.dart';
import 'package:segak/screen/learning/turutan5.dart';
import 'package:segak/component/widget.dart';

class MyLearning extends StatelessWidget {
  const MyLearning({super.key});

  final double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: const Text(
              'Laman Pembelajaran',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )),
        body: ListView(children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true, Icons.ondemand_video),
                //let's create a common header widget
              ),
              const Text(
                "E-PEMBELAJARAN",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/ujian.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        const ListTile(
                          title: Text(
                            '*TERMA & SYARAT',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Pelajar harus memakai kasut dan pakaian yang sesuai.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TurutanJisim(),
                        ),
                      );
                    },
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'TURUTAN 1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Pengiraan Indeks Jisim Badan',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/jisim2.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        const ListTile(
                          title: Center(
                            child: Text(
                              'Info Lanjut',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TurutanBangku(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'TURUTAN 2',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Ujian Naik Turun Bangku Selama 3 Minit',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/naik.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        const ListTile(
                          title: Center(
                            child: Text(
                              'Info Lanjut',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TurutanTekan(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'TURUTAN 3',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Ujian Tekan Tubi atau Tekan Tubi Ubah Suai',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/tekan.jpg',
                              height: 150, fit: BoxFit.fill),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/tekan2.jpg',
                              height: 150, fit: BoxFit.fill),
                        ),
                        const ListTile(
                          title: Center(
                            child: Text(
                              'Info Lanjut',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TurutanRingkuk(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'TURUTAN 4',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Ujian Ringkuk Tubi Separa',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/tubi.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        const ListTile(
                          title: Center(
                            child: Text(
                              'Info Lanjut',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TurutanMelunjur(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'TURUTAN 5',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Ujian Jangkauan Melunjur',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/melunjur.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        const ListTile(
                          title: Center(
                            child: Text(
                              'Info Lanjut',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
