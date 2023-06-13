import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:segak/screen/exam/lihat_skor.dart';
import 'package:segak/utils/helper.dart';
import 'package:segak/utils/styles.dart';

import '../services/auth.dart';

class HeadingSection extends StatefulWidget {
  const HeadingSection({super.key});

  @override
  State<HeadingSection> createState() => _HeadingSectionState();
}

class _HeadingSectionState extends State<HeadingSection> {
  final AuthService _auth = AuthService();
  String? username = "";
  String? usertype = "";
  String? gender = "";
  String? age = "";
  String? isExist = "";
  Future<void> getUserData() async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        username = documentSnapshot.get('name').toString();

        usertype = documentSnapshot.get('usertype').toString();

        gender = documentSnapshot.get('gender').toString();

        age = documentSnapshot.get('age').toString();
      } else {
        isExist = null;
      }
      setState(() => isExist = "true");
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isExist == null
        ? const Center(child: Text("Loading"))
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey.shade300,
                      size: 30.0,
                    ),
                    // decoration: BoxDecoration(
                    //   color: text,
                    //   borderRadius: BorderRadius.circular(100),
                    //   // image: const DecorationImage(
                    //   //   image: AssetImage('/assets/images/profile.png'),
                    //   // ),
                    // ),
                    // height: 50,
                    // width: 50,
                  ),
                  SizedBox(width: small),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selamat Datang', style: heading1),
                      Text(username!, style: pBold),
                      Text(usertype!, style: pBold),
                      Text(gender!, style: pBold),
                      Text("${age!} Tahun", style: pBold),
                    ],
                  ),
                ],
              ),
              Icon(Icons.notifications, color: icon, size: 28)
            ],
          );
  }
}

// class HeadingSection extends StatelessWidget {
//   const HeadingSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: text,
//                 borderRadius: BorderRadius.circular(100),
//                 // image: const DecorationImage(
//                 //   image: AssetImage('/assets/images/profile.png'),
//                 // ),
//               ),
//               height: 50,
//               width: 50,
//             ),
//             SizedBox(width: small),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Welcome', style: p1),
//                 Text('Rafiq', style: heading3),
//               ],
//             ),
//           ],
//         ),
//         Icon(Icons.notifications, color: icon, size: 28)
//       ],
//     );
//   }
// }
