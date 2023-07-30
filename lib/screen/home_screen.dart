import 'package:flutter/material.dart';
import '../component/text_home.dart';
import '../utils/styles.dart';
import 'package:segak/component/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: const Text(
              'Laman Utama',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )),
        body: ListView(children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true, Icons.home),
                //let's create a common header widget
              ),
              const Text(
                "UTAMA",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Colors.white,
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
                          child: Image.asset('assets/images/segak.jpg',
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        const ListTile(
                            title: Text(
                          'MAKLUMAT AM SEGAK',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: xsmall, top: 10, right: medium),
                  child: Column(
                    children: [
                      const TextHome(),
                      SizedBox(height: medium),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
