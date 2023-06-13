import 'package:flutter/material.dart';
import 'package:segak/component/learning_text/turutan2_text.dart';
import 'package:segak/screen/learning/norma_lelaki.dart';
import 'norma_perempuan.dart';

// ignore: duplicate_import
import '../../component/learning_text/turutan2_text.dart';
import '../../component/learning_text/yt_turutan2.dart';
import '../../utils/helper.dart';
import '../../utils/styles.dart';

import '../../component/learning_text/turutan2_text2.dart';
import '../../component/learning_text/turutan2_text3.dart';

class TurutanBangku extends StatelessWidget {
  const TurutanBangku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Turutan 2',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )),
        // body: Image.asset(
        //   'assets/images/segak.jpg',
        //   height: 500,
        //   width: 2000,
        // ),
        body: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                // onTap: () => print("SEGAK"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                  children: <Widget>[
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
                      title: Text(
                        'UJIAN 2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Ujian Naik Turun Bangku Selama 3 Minit',
                        style: TextStyle(
                          fontSize: 14,
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
            child: Padding(
              padding: EdgeInsets.only(left: xsmall, top: 10, right: medium),
              child: Column(
                children: [
                  const Text1TurutanBangku(),
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
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: xsmall, top: 10, right: medium),
              child: Column(
                children: [
                  const Text(
                    'NORMA SEGAK',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Norma SEGAK mengikut umur dan jantina bagi setiap ujian adalah seperti berikut:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            'Lelaki'.toUpperCase(),
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
                              builder: (context) => NormaSegakLelaki(),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            'Perempuan'.toUpperCase(),
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
                              builder: (context) => NormaSegakPerempuan(),
                            ),
                          );
                        }),
                  ),

                  // const Text(
                  //   "NORMA UJIAN NAIK TURUN BANGKU (LELAKI)\n",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // const Text2TurutanBangku(),
                  // const Text(
                  //   "\nNORMA UJIAN NAIK TURUN BANGKU (PEREMPUAN)\n",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // const Text3TurutanBangku(),
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
                      builder: (context) => YTTurutan2(),
                    ),
                  );
                },
                // => print("SEGAK"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/images/bangku.jpg',
                          // width: 300,
                          height: 150,
                          fit: BoxFit.fill),
                    ),
                    const ListTile(
                      title: Center(
                        child: Text(
                          'Tonton Video',
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
        ]));
  }
}