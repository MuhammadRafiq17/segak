import 'package:flutter/material.dart';
import 'package:segak/screen/authenticate/sign_in.dart';
import 'package:segak/screen/authenticate/sign_up.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({Key? key}) : super(key: key);

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return UserSignIn(onClickedRegister: toggleView);
    } else {
      return UserSignup(onClickedSignin: toggleView);
    }
  }
}
