import 'package:flutter/material.dart';
import 'package:segak/component/heading.dart';
import 'package:segak/component/widget.dart';
import 'package:segak/screen/authenticate/sign_in.dart';
import 'package:segak/screen/guru/cipta_kelas.dart';
import 'package:segak/screen/guru/lihat_kelas.dart';
import 'package:segak/wrapper.dart';
import '../../services/auth.dart';
import '../../utils/styles.dart';

class Guru extends StatelessWidget {
  Guru({super.key});
  final AuthService _auth = AuthService();

  final double _headerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Laman Guru',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        automaticallyImplyLeading: false,
      ),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        child: ListView(
          // Important: Remove any padding from the ListView.
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
                              builder: (context) => CiptaKelasScreen(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch, // add this
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'CIPTA KELAS',
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
                              child: Image.asset('assets/images/cipta.jpg',
                                  height: 150, fit: BoxFit.fill),
                            ),
                            const ListTile(
                              title: Center(
                                child: Text(
                                  'Cipta Sekarang',
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
                              builder: (context) => LihatKelas(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch, // add this
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'LIHAT KELAS ANDA',
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
                              child: Image.asset('assets/images/kelasanda.jpg',
                                  height: 150, fit: BoxFit.fill),
                            ),
                            const ListTile(
                              title: Center(
                                child: Text(
                                  'Lihat Sekarang',
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
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
