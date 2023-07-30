import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/auth.dart';
import 'package:segak/utils/helper.dart';
import 'package:segak/component/widget.dart';
import '../../component/loading.dart';

class UserSignup extends StatefulWidget {
  final Function() onClickedSignin;
  const UserSignup({
    Key? key,
    required this.onClickedSignin,
  }) : super(key: key);

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';
  var username = '';
  var phoneNo = '';
  var gender = '';
  var usertype = '';
  var age = '';
  int dropgender = 0;
  int dropusertype = 0;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  const SizedBox(
                    height: 150,
                    child: HeaderWidget(
                        150, false, Icons.person_add_alt_1_rounded),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 5, color: Colors.white),
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
                                      size: 80.0,
                                    ),
                                  ),
                                ],
                              ), //person icon
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top:
                                              20), // add padding to adjust text
                                      isDense: true,
                                      hintText: "Nama Pengguna",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child: Icon(Icons.supervisor_account),
                                      ),
                                    ),
                                    onChanged: (val) {
                                      setState(() => username = val);
                                    }),
                              ), //username
                              const SizedBox(height: 20.0),
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
                                    keyboardType: TextInputType.emailAddress,
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
                              ), //email address
                              const SizedBox(height: 20.0),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top:
                                              20), // add padding to adjust text
                                      isDense: true,
                                      hintText: "Nombor Telefon",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child: Icon(Icons.phone_enabled),
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Nombor telefon tidak boleh kosong";
                                      } else if (!RegExp(
                                              r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$")
                                          .hasMatch(val)) {
                                        return "Masukkan nombor telefon yang sah";
                                      }
                                      return null;
                                    },
                                    onChanged: (val) {
                                      setState(() => phoneNo = val);
                                    }),
                              ), //mobile number
                              const SizedBox(height: 20.0),
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
                                    validator: (val) {
                                      if (!(val!.isEmpty) && (val.length < 8)) {
                                        return "Kata laluan mestilah sekurang-kurangnya 8 aksara";
                                      }
                                      return null;
                                    },
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    }),
                              ), //password
                              const SizedBox(height: 20.0),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top:
                                              20), // add padding to adjust text
                                      isDense: true,
                                      hintText: "Umur",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                15), // add padding to adjust icon
                                        child: Icon(Icons.date_range),
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Umur tidak boleh kosong";
                                      }
                                      return null;
                                    },
                                    onChanged: (val) {
                                      setState(() => age = val);
                                    }),
                              ),

                              const SizedBox(height: 20.0),
                              DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        top: 1), // add padding to adjust icon
                                    child: Icon(
                                      Icons.man_outlined,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                dropdownColor: Colors.white,
                                value: dropgender,
                                onChanged: (int? newValue) {
                                  setState(() {
                                    dropgender = newValue!;
                                  });
                                  if (dropgender == 1) {
                                    gender = "Lelaki";
                                  } else if (dropgender == 2) {
                                    gender = "Perempuan";
                                  }
                                },
                                items: const <DropdownMenuItem<int>>[
                                  DropdownMenuItem(
                                    child: Text('Jantina'),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Lelaki'),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Perempuan'),
                                    value: 2,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),

                              DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        top: 1), // add padding to adjust icon
                                    child: Icon(
                                      Icons.supervised_user_circle,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                dropdownColor: Colors.white,
                                value: dropusertype,
                                onChanged: (int? newValue) {
                                  setState(() {
                                    dropusertype = newValue!;
                                  });
                                  if (dropusertype == 1) {
                                    usertype = "Pelajar";
                                  } else if (dropusertype == 2) {
                                    usertype = "Guru";
                                  }
                                },
                                items: const <DropdownMenuItem<int>>[
                                  DropdownMenuItem(
                                    child: Text('Jenis Pengguna'),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Pelajar'),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Guru'),
                                    value: 2,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      "Daftar".toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (dropgender != 0) {
                                        if (dropusertype != 0) {
                                          setState(() => loading = true);
                                          await _auth
                                              .registerWithEmailAndPassword(
                                                  email,
                                                  password,
                                                  username,
                                                  phoneNo,
                                                  age,
                                                  gender,
                                                  usertype,
                                                  // dropdownValue.toString(),
                                                  context);
                                          setState(() => loading = false);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Pilih Jenis Pengguna ",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              fontSize: 20.0,
                                              backgroundColor:
                                                  Colors.transparent,
                                              textColor: Colors.red);
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Pilih Jantina ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            fontSize: 20.0,
                                            backgroundColor: Colors.transparent,
                                            textColor: Colors.red);
                                      }
                                    }
                                  },
                                ),
                              ), //Register button
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Sudah mempunyai akaun? "),
                                  TextSpan(
                                    text: 'Log masuk',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = widget.onClickedSignin,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ])),
                              ), //Sign In button
                            ],
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
