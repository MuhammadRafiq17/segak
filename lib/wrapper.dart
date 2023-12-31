import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:segak/screen/authenticate/authen.dart';
import 'package:segak/screen/authenticate/verify_email.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something when wrong!'));
          } else if (snapshot.hasData) {
            return const VerifyEmail();
          } else {
            return const UserAuth();
          }
        },
      ),
    );
  }
}

// class Wrapper extends StatelessWidget {
//   const Wrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserData?>(context);
//     print(user);
//     //return home or signin
//     //return BottomNav();
//     if (user == null) {
//       return UserSignIn();
//     } else {
//       return BottomNav();
//     }
//   }
// }


