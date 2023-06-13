import 'package:flutter/material.dart';
import 'package:segak/screen/exam_mainscreen.dart';
import 'package:segak/screen/exam_screen.dart';
import 'package:segak/screen/home_screen.dart';
import 'package:segak/screen/learning_screen.dart';
import 'package:segak/utils/styles.dart';
import 'package:segak/screen/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _MyAppState();
}

class _MyAppState extends State<BottomNav> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const MyLearning(),
    const ExamMain(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
          // body: GoogleMap(
          //   onMapCreated: _onMapCreated,
          //   initialCameraPosition: CameraPosition(
          //     target: _center,
          //     zoom: 17.0,
          //   ),
          body: Center(child: pages.elementAt(selectedIndex)),
          bottomNavigationBar: SizedBox(
            height: 94,
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: onItemTapped,
              selectedItemColor: Colors.green,
              unselectedItemColor: icon,
              backgroundColor: white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Utama',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.ondemand_video),
                  label: 'Pembelajaran',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.note_alt_outlined),
                  label: 'Ujian',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
            ),
          )),
    );
  }
}
