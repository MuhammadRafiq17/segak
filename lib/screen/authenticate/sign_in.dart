import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import 'package:segak/utils/helper.dart';
import 'package:segak/component/widget.dart';

import 'package:segak/screen/authenticate/forgot_password.dart';
// import 'package:segak/screen/authenticate/sign_up.dart';
// import '../../component/loading.dart';
// import '../../utils/styles.dart';

class UserSignIn extends StatefulWidget {
  //const UserSignIn({Key? key}) : super(key: key);
  //  const UserSignIn({super.key, required void Function() onClickedRegister});
  final Function() onClickedRegister;

  const UserSignIn({
    Key? key,
    required this.onClickedRegister,
  }) : super(key: key);

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;

  var email = '';
  var password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Text(
                        'Hai!',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Log masuk ke akaun anda',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top:
                                              20), // add padding to adjust text
                                      isDense: true,
                                      hintText: "E-mel",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child: Icon(Icons.email_outlined),
                                      ),
                                    ),
                                    // ThemeHelper()
                                    //     .textInputDecoration(
                                    //         'Email', 'Enter your email'
                                    //         ),

                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "E-mel tidak boleh kosong";
                                      } else if (!EmailValidator.validate(
                                          val)) {
                                        return "Masukkan alamat e-mel yang sah";
                                      }
                                      return null;
                                    },
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    }),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top:
                                              20), // add padding to adjust text
                                      isDense: true,
                                      hintText: "Kata laluan",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child: Icon(
                                          Icons.lock_outlined,
                                        ),
                                      ),
                                    ),
                                    //ThemeHelper()
                                    // .textInputDecoration(
                                    //     'Password', 'Enter your password'),
                                    validator: (val) => val!.length < 8
                                        ? 'Kata laluan mestilah sekurang-kurangnya 8 aksara'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    }),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword()),
                                    );
                                  },
                                  child: const Text(
                                    "Terlupa kata laluan anda?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      'Log Masuk'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => const Center(
                                            child:
                                                CircularProgressIndicator()));
                                    if (_formKey.currentState!.validate()) {
                                      await _auth.signIn(email, password);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(text: "Tiada akaun? "),
                                  TextSpan(
                                    text: 'CIPTA',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = widget.onClickedRegister,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ])),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                error,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              )
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// class UserSignIn extends StatefulWidget {
//   const UserSignIn({super.key, required void Function() onClickedRegister});

//   @override
//   State<UserSignIn> createState() => _UserSignInState();
// }

// class _UserSignInState extends State<UserSignIn> {
//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();
//   String email = "";
//   String password = "";
//   String error = "";
//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? const Loading()
//         : Scaffold(
//             backgroundColor: Colors.brown[100],
//             appBar: AppBar(
//               backgroundColor: Colors.brown[400],
//               elevation: 0.0,
//               title: const Text('Dah sign in'),
//               automaticallyImplyLeading: false,
//             ),
//             body: Container(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 20.0, horizontal: 50.0),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         validator: (val) =>
//                             val!.isEmpty ? "Enter an email" : null,
//                         onChanged: (val) {
//                           setState(() => email = val);
//                         },
//                       ),
//                       TextFormField(
//                         obscureText: true,
//                         validator: (val) => (val!.length < 8 || val.length > 21)
//                             ? "Enter a password 8 to 20 chars long"
//                             : null,
//                         onChanged: (val) {
//                           setState(() => password = val);
//                         },
//                       ),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             textStyle: TextStyle(fontSize: 20),
//                             minimumSize: Size.fromHeight(50),
//                           ),
//                           child: const Text('Sign in '),
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                               setState(() => loading = true);
//                               dynamic result = await _auth.signInEmailPassword(
//                                   email, password);
//                               if (result == null) {
//                                 setState(() => error =
//                                     'Could not sign in with those credentials.');
//                                 loading = false;
//                               } else {
//                                 setState(() => error = '');
//                                 loading = false;
//                               }
//                             }
//                           }),
//                       const SizedBox(
//                         height: 12.0,
//                       ),
//                       Text(
//                         error,
//                         style:
//                             const TextStyle(color: Colors.red, fontSize: 14.0),
//                       ),
//                       // ElevatedButton(
//                       //   child: const Text('SIgn in anon!'),
//                       //   onPressed: () async {
//                       //     dynamic result = await _auth.signInAnon();
//                       //     if (result == null) {
//                       //       print('CANNOT SIGNIN');
//                       //     } else {
//                       //       print('berjaya signin');
//                       //       print(result.uid);
//                       //     }
//                       //   },
//                       // ),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             textStyle: TextStyle(fontSize: 20),
//                             minimumSize: Size.fromHeight(50),
//                           ),
//                           child: const Text('Register'),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const UserSignup()),
//                             );
//                           }),
//                     ],
//                   ),
//                 )),
//           );
//   }
// }
