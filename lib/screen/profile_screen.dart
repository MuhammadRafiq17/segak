import 'package:flutter/material.dart';
import 'package:segak/component/exam_widget/profile_skor.dart';
import 'package:segak/component/exam_widget/sertai_kelas.dart';
import 'package:segak/screen/authenticate/sign_in.dart';
import 'package:segak/screen/exam/lihat_skor.dart';
import 'package:segak/screen/exam/penggal_2/skor_p2.dart';
import 'package:segak/utils/helper.dart';
import 'package:segak/utils/styles.dart';

import '../component/heading.dart';
import '../services/auth.dart';
import 'package:segak/component/widget.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final AuthService _auth = AuthService();

  final double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Laman Profil',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.manage_accounts,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text('Tetapan Akaun'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.logout, color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text('Log keluar'),
              onTap: () async {
                dynamic result = await _auth.SignOut();
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserSignIn(
                            onClickedRegister: () {},
                          )),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.person),
              //let's create a common header widget
            ),
            const Text(
              "PROFIL",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: medium, top: 50, right: medium),
              child: Column(
                children: [
                  const HeadingSection(),
                  SizedBox(height: medium),
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
                              builder: (context) => SertaiKelasScreen(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch, // add this
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'SERTAI KELAS',
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
                              child: Image.asset('assets/images/kelas.jpg',
                                  height: 150, fit: BoxFit.fill),
                            ),
                            const ListTile(
                              title: Center(
                                child: Text(
                                  'Sertai Sekarang',
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
                              builder: (context) => ProfilLihatSkorScreen(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch, // add this
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'SKOR UJIAN SEGAK',
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
                              child: Image.asset('assets/images/skor.jpg',
                                  height: 150, fit: BoxFit.fill),
                            ),
                            const ListTile(
                              title: Center(
                                child: Text(
                                  'Lihat Skor',
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
            ),
          ],
        ),
      ),
    );
  }
}
