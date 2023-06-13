import 'package:flutter/material.dart';

import '../../component/learning_text/turutan1_text.dart';
import '../../component/learning_text/turutan1_text2.dart';
import '../../component/learning_text/yt_turutan1.dart';
import '../../utils/styles.dart';

class TurutanJisim extends StatelessWidget {
  const TurutanJisim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Turutan 1',
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
                      child: Image.asset('assets/images/jisim2.jpg',
                          // width: 300,
                          height: 150,
                          fit: BoxFit.fill),
                    ),
                    const ListTile(
                      title: Text(
                        'UJIAN 1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Pengiraan Indeks Jisim Badan',
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
                  const TextTurutanJisim(),
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
                  const Text2TurutanJisim(),
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
                // onTap: () => print("SEGAK"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                  children: <Widget>[
                    const ListTile(
                      title: Text(
                        'NORMA INDEKS JISIM BADAN (BMI)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Berdasarkan kepada World Health Organization (WHO, 2007)',
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
                      child: Image.asset('assets/images/bmilelaki.jpg',
                          // width: 300,
                          height: 150,
                          fit: BoxFit.fill),
                    ),
                    const ListTile(
                      title: Center(
                        child: Text(
                          'Norma BMI bagi murid lelaki',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/images/bmiperempuan.jpg',
                          // width: 300,
                          height: 150,
                          fit: BoxFit.fill),
                    ),
                    const ListTile(
                      title: Center(
                        child: Text(
                          'Norma BMI bagi murid perempuan',
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
                      builder: (context) => YTTurutan1(),
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
                      child: Image.asset('assets/images/mengira.jpg',
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
