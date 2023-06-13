import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class NormaSegakPerempuan extends StatelessWidget {
  const NormaSegakPerempuan({super.key});

  final double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Norma Segak Perempuan',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )),
        // body: Image.asset(
        //   'assets/images/segak.jpg',
        //   height: 500,
        //   width: 2000,
        // ),

        body: ListView(children: <Widget>[
          Column(
            children: [
              const SizedBox(height: 30.0),
              const Text(
                "NORMA SEGAK PEREMPUAN MENGIKUT UMUR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    // onTap: () {},
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Perempuan 10 Tahun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/np10tahun.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
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
                    // onTap: () {},
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Perempuan 11 Tahun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/np11tahun.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
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
                    // onTap: () {},
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Perempuan 12 Tahun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/np12tahun.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
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
                    // onTap: () {},
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Perempuan 13 Tahun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/np13tahun.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
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
                    // onTap: () {},
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Perempuan 14 Tahun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/np14tahun.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
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
                    // onTap: () {},
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Perempuan 15 Tahun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/np15tahun.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
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
                    // onTap: () {},
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Perempuan 16 Tahun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/np16tahun.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
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
                    // onTap: () {},
                    // => print("SEGAK"),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Perempuan 17 Tahun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset('assets/images/np17tahun.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: xsmall, top: 10, right: medium),
                  child: Column(
                    children: [
                      const Text(
                        "Jumlah skor keseluruhan seorang murid diambil daripada skor Ujian Naik Turun Bangku 3 Minit, Tekan Tubi atau Tekan Tubi Ubah Suai, Ringkuk Tubi Separa, dan Jangkauan Melunjur untuk menentukan pencapaian SEGAK.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: medium),
                      // const SearchSection(),
                      // SizedBox(height: medium),
                      // LabelSection(text: 'Recommended', style: heading1),
                      // SizedBox(height: medium),
                      // const Recommended(),
                      // SizedBox(height: medium),
                      // LabelSection(text: 'Top Desination', style: heading2),
                      // SizedBox(height: medium),
                      // const Top(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ]));
  }
}
