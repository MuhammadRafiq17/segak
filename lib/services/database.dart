import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_models.dart';

class UserDatabaseService {
  final String uid;
  UserDatabaseService({required this.uid});

  final userdata = FirebaseFirestore.instance.collection('users');
  final exam1data = FirebaseFirestore.instance.collection('exam1');
  final exam2data = FirebaseFirestore.instance.collection('exam2');
  final exam3data = FirebaseFirestore.instance.collection('exam3');
  final exam4data = FirebaseFirestore.instance.collection('exam4');
  final exam5data = FirebaseFirestore.instance.collection('exam5');
  final kelasData = FirebaseFirestore.instance.collection('Kelas');

  Future setuserdata(String username, String email, String phoneNo,
      String gender, String age, String usertype) async {
    //const int access_level = 1;

    final userData = Users(
        uid: uid,
        email: email,
        name: username,
        phone: phoneNo,
        //access_level: access_level,
        gender: gender,
        usertype: usertype,
        age: age);

    if (usertype == 'Pelajar') {
      await FirebaseFirestore.instance
          .collection('Pelajar')
          .doc(uid)
          .set(userData.toJson());
    } else if (usertype == 'Guru') {
      await FirebaseFirestore.instance
          .collection('Guru')
          .doc(uid)
          .set(userData.toJson());
    }

    await userdata.doc(uid).set(userData.toJson());
  }

  Future<void> updateExam1(double weight, double height) async {
    String age = "";
    double bmi = 0.0;
    String score = "";
    String gender = "";
    List<String> scorelistbmi = [
      'Kurus',
      'Berat Badan Normal',
      'Berlebihan Berat Badan',
      'Obes'
    ];
    List<String> agelist = ['10', '11', '12', '13', '14', '15', '16', '17'];
    List<double> bmikurus = [13.6, 14.0, 14.4, 14.8, 15.4, 15.9, 16.4, 16.8];
    List<double> bminormal1 = [13.7, 14.1, 14.5, 14.9, 15.5, 16.0, 16.5, 16.9];
    List<double> bminormal2 = [18.5, 19.2, 16.9, 20.8, 21.8, 22.7, 23.5, 24.3];
    List<double> bmilebih1 = [18.6, 19.3, 20.0, 20.9, 21.9, 22.8, 23.6, 24.4];
    List<double> bmilebih2 = [21.4, 22.5, 23.6, 24.8, 25.9, 27.0, 27.9, 28.6];
    // List<double> bmiobes = [21.4, 22.5, 23.6, 24.8, 25.9, 27.0, 27.9, 28.6];

    List<double> bmikurusP = [13.4, 13.8, 14.3, 14.8, 15.3, 15.8, 16.1, 16.3];
    List<double> bminormal1P = [13.5, 13.9, 14.4, 14.9, 15.4, 15.9, 16.2, 16.4];
    List<double> bminormal2P = [19.0, 19.9, 20.8, 21.8, 22.7, 23.5, 24.1, 24.5];
    List<double> bmilebih1P = [19.1, 20.0, 20.9, 21.9, 22.8, 23.6, 24.2, 24.6];
    List<double> bmilebih2P = [22.6, 23.7, 25.0, 26.2, 27.3, 28.2, 28.9, 29.3];
    // List<double> bmiobesP = [21.4, 22.5, 23.6, 24.8, 25.9, 27.0, 27.9, 28.6];
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        age = documentSnapshot.get('age').toString();
        gender = documentSnapshot.get('gender').toString();
        final querySnapshot = await exam1data
            .doc(userFirebase.uid + age)
            .collection(userFirebase.uid)
            .get();
        int ifPenggal1Exist = querySnapshot.docs.length;
        if (ifPenggal1Exist <= 2) {
          bmi = weight / ((height / 100) * (height / 100));
          for (int i = 0; i < 8; i++) {
            if (agelist[i] == age) {
              if (gender == 'Lelaki') {
                if (bmi <= bmikurus[i]) {
                  score = scorelistbmi[0];
                } else if (bmi >= bminormal1[i] && bmi <= bminormal2[i]) {
                  score = scorelistbmi[1];
                } else if (bmi >= bmilebih1[i] && bmi <= bmilebih2[i]) {
                  score = scorelistbmi[2];
                } else {
                  score = scorelistbmi[3];
                }
              } else if (gender == 'Perempuan') {
                // bmikurusP
                if (bmi <= bmikurusP[i]) {
                  score = scorelistbmi[0];
                } else if (bmi >= bminormal1P[i] && bmi <= bminormal2P[i]) {
                  score = scorelistbmi[1];
                } else if (bmi >= bmilebih1P[i] && bmi <= bmilebih2P[i]) {
                  score = scorelistbmi[2];
                } else {
                  score = scorelistbmi[3];
                }
              }
            }
          }
          if (ifPenggal1Exist == 0) {
            exam1data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_1')
                .set({
              'weight': weight.toString(),
              'height': height.toString(),
              'bmi': bmi.toString(),
              'score': score,
            });
          } else if (ifPenggal1Exist == 1) {
            exam1data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_2')
                .set({
              'weight': weight.toString(),
              'height': height.toString(),
              'bmi': bmi.toString(),
              'score': score,
            });
          }
        }
      }
    });
  } // exam 1 bmi

  Future<void> updateExam2(int nadiValue) async {
    String age = "";
    String score = "";
    String gender = "";
    List<String> scorelist = ['5', '4', '3', '2', '1'];
    List<String> agelist = ['10', '11', '12', '13', '14', '15', '16', '17'];
    List<double> score5 = [79, 78, 77, 76, 76, 75, 74, 70];
    List<double> score4 = [80, 79, 78, 77, 77, 76, 75, 71];
    List<double> score4_2 = [101, 101, 100, 98, 98, 97, 96, 91];
    List<double> score3 = [102, 102, 101, 99, 99, 98, 97, 92];
    List<double> score3_2 = [125, 124, 123, 121, 121, 120, 119, 112];
    List<double> score2 = [126, 125, 124, 122, 122, 121, 120, 113];
    List<double> score2_2 = [148, 147, 146, 143, 143, 142, 140, 133];

    List<double> score5P = [84, 86, 83, 82, 81, 80, 78, 75];
    List<double> score4P = [85, 87, 84, 83, 82, 81, 79, 76];
    List<double> score4_2P = [108, 111, 107, 106, 104, 104, 100, 97];
    List<double> score3P = [109, 112, 108, 107, 105, 105, 101, 98];
    List<double> score3_2P = [133, 136, 132, 130, 128, 128, 124, 120];
    List<double> score2P = [134, 137, 133, 131, 129, 129, 125, 121];
    List<double> score2_2P = [158, 161, 156, 154, 152, 151, 146, 142];
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        age = documentSnapshot.get('age').toString();
        gender = documentSnapshot.get('gender').toString();
        final querySnapshot = await exam2data
            .doc(userFirebase.uid + age)
            .collection(userFirebase.uid)
            .get();
        int ifPenggal1Exist = querySnapshot.docs.length;
        if (ifPenggal1Exist <= 2) {
          for (int i = 0; i < 8; i++) {
            if (agelist[i] == age) {
              if (gender == 'Lelaki') {
                if (nadiValue <= score5[i]) {
                  score = scorelist[0];
                } else if (nadiValue >= score4[i] && nadiValue <= score4_2[i]) {
                  score = scorelist[1];
                } else if (nadiValue >= score3[i] && nadiValue <= score3_2[i]) {
                  score = scorelist[2];
                } else if (nadiValue >= score2[i] && nadiValue <= score2_2[i]) {
                  score = scorelist[3];
                } else {
                  score = scorelist[4];
                }
              } else if (gender == 'Perempuan') {
                if (nadiValue <= score5P[i]) {
                  score = scorelist[0];
                } else if (nadiValue >= score4P[i] &&
                    nadiValue <= score4_2P[i]) {
                  score = scorelist[1];
                } else if (nadiValue >= score3P[i] &&
                    nadiValue <= score3_2P[i]) {
                  score = scorelist[2];
                } else if (nadiValue >= score2P[i] &&
                    nadiValue <= score2_2P[i]) {
                  score = scorelist[3];
                } else {
                  score = scorelist[4];
                }
              }
            }
          }
          if (ifPenggal1Exist == 0) {
            exam2data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_1')
                .set({
              'nadi': nadiValue.toString(),
              'score': score,
            });
          } else if (ifPenggal1Exist == 1) {
            exam2data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_2')
                .set({
              'nadi': nadiValue.toString(),
              'score': score,
            });
          }
        }
      }
    });
  } // Exam 2 nadi

  Future<void> updateExam3(int tekan) async {
    String age = "";
    String score = "";
    String gender = "";
    List<String> scorelist = ['5', '4', '3', '2', '1'];
    List<String> agelist = ['10', '11', '12', '13', '14', '15', '16', '17'];
    List<double> score5 = [15, 16, 18, 25, 27, 30, 30, 31];
    List<double> score4 = [14, 15, 17, 24, 26, 29, 29, 30];
    List<double> score4_2 = [13, 13, 15, 21, 22, 24, 25, 26];
    List<double> score3 = [12, 12, 14, 20, 21, 23, 24, 25];
    List<double> score3_2 = [9, 9, 11, 15, 17, 18, 19, 19];
    List<double> score2 = [8, 8, 10, 14, 16, 17, 18, 18];
    List<double> score2_2 = [7, 7, 8, 11, 12, 13, 13, 14];

    List<double> score5P = [21, 21, 21, 22, 22, 23, 23, 24];
    List<double> score4P = [20, 20, 20, 21, 21, 22, 22, 23];
    List<double> score4_2P = [17, 17, 18, 18, 19, 19, 19, 20];
    List<double> score3P = [16, 16, 17, 17, 18, 18, 18, 19];
    List<double> score3_2P = [13, 13, 13, 13, 14, 14, 14, 15];
    List<double> score2P = [12, 12, 12, 12, 13, 13, 13, 14];
    List<double> score2_2P = [9, 9, 9, 9, 10, 10, 10, 10];
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        age = documentSnapshot.get('age').toString();
        gender = documentSnapshot.get('gender').toString();
        final querySnapshot = await exam3data
            .doc(userFirebase.uid + age)
            .collection(userFirebase.uid)
            .get();
        int ifPenggal1Exist = querySnapshot.docs.length;
        if (ifPenggal1Exist <= 2) {
          tekan = tekan;
          for (int i = 0; i < 8; i++) {
            if (agelist[i] == age) {
              if (gender == 'Lelaki') {
                if (tekan >= score5[i]) {
                  score = scorelist[0];
                } else if (tekan <= score4[i] && tekan >= score4_2[i]) {
                  score = scorelist[1];
                } else if (tekan <= score3[i] && tekan >= score3_2[i]) {
                  score = scorelist[2];
                } else if (tekan <= score2[i] && tekan >= score2_2[i]) {
                  score = scorelist[3];
                } else {
                  score = scorelist[4];
                }
              } else if (gender == 'Perempuan') {
                if (tekan >= score5P[i]) {
                  score = scorelist[0];
                } else if (tekan <= score4P[i] && tekan >= score4_2P[i]) {
                  score = scorelist[1];
                } else if (tekan <= score3P[i] && tekan >= score3_2P[i]) {
                  score = scorelist[2];
                } else if (tekan <= score2P[i] && tekan >= score2_2P[i]) {
                  score = scorelist[3];
                } else {
                  score = scorelist[4];
                }
              }
            }
          }
          if (ifPenggal1Exist == 0) {
            exam3data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_1')
                .set({
              'tekan': tekan.toString(),
              'score': score,
            });
          } else if (ifPenggal1Exist == 1) {
            exam3data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_2')
                .set({
              'tekan': tekan.toString(),
              'score': score,
            });
          }
        }
      }
    });
  } // exam 3 tekan

  Future<void> updateExam4(int ringkuk) async {
    String age = "";
    String score = "";
    String gender = "";
    List<String> scorelist = ['5', '4', '3', '2', '1'];
    List<String> agelist = ['10', '11', '12', '13', '14', '15', '16', '17'];
    List<double> score5 = [18, 19, 20, 21, 22, 23, 23, 23];
    List<double> score4 = [17, 18, 19, 20, 21, 22, 22, 22];
    List<double> score4_2 = [15, 16, 16, 17, 18, 19, 19, 19];
    List<double> score3 = [14, 15, 15, 16, 17, 18, 18, 18];
    List<double> score3_2 = [11, 12, 12, 13, 13, 14, 14, 14];
    List<double> score2 = [10, 11, 11, 12, 12, 13, 13, 13];
    List<double> score2_2 = [8, 8, 8, 9, 9, 10, 10, 10];

    List<double> score5P = [18, 18, 18, 19, 19, 19, 19, 19];
    List<double> score4P = [17, 17, 17, 18, 18, 18, 18, 18];
    List<double> score4_2P = [15, 15, 15, 16, 16, 16, 16, 16];
    List<double> score3P = [14, 14, 14, 15, 15, 15, 15, 15];
    List<double> score3_2P = [11, 11, 11, 11, 11, 11, 11, 12];
    List<double> score2P = [10, 10, 10, 10, 10, 10, 10, 11];
    List<double> score2_2P = [8, 8, 8, 8, 8, 8, 8, 8];
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        age = documentSnapshot.get('age').toString();
        gender = documentSnapshot.get('gender').toString();
        final querySnapshot = await exam4data
            .doc(userFirebase.uid + age)
            .collection(userFirebase.uid)
            .get();
        int ifPenggal1Exist = querySnapshot.docs.length;
        if (ifPenggal1Exist <= 2) {
          ringkuk = ringkuk;
          for (int i = 0; i < 8; i++) {
            if (agelist[i] == age) {
              if (gender == 'Lelaki') {
                if (ringkuk >= score5[i]) {
                  score = scorelist[0];
                } else if (ringkuk <= score4[i] && ringkuk >= score4_2[i]) {
                  score = scorelist[1];
                } else if (ringkuk <= score3[i] && ringkuk >= score3_2[i]) {
                  score = scorelist[2];
                } else if (ringkuk <= score2[i] && ringkuk >= score2_2[i]) {
                  score = scorelist[3];
                } else {
                  score = scorelist[4];
                }
              } else if (gender == 'Perempuan') {
                if (ringkuk >= score5P[i]) {
                  score = scorelist[0];
                } else if (ringkuk <= score4P[i] && ringkuk >= score4_2P[i]) {
                  score = scorelist[1];
                } else if (ringkuk <= score3P[i] && ringkuk >= score3_2P[i]) {
                  score = scorelist[2];
                } else if (ringkuk <= score2P[i] && ringkuk >= score2_2P[i]) {
                  score = scorelist[3];
                } else {
                  score = scorelist[4];
                }
              }
            }
          }
          if (ifPenggal1Exist == 0) {
            exam4data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_1')
                .set({
              'ringkuk': ringkuk.toString(),
              'score': score,
            });
          } else if (ifPenggal1Exist == 1) {
            exam4data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_2')
                .set({
              'ringkuk': ringkuk.toString(),
              'score': score,
            });
          }
        }
      }
    });
  } // exam 4 ringkuk

  Future<void> updateExam5(double jarak) async {
    String age = "";
    String score = "";
    String gender = "";
    List<String> scorelist = ['5', '4', '3', '2', '1'];
    List<String> agelist = ['10', '11', '12', '13', '14', '15', '16', '17'];
    List<double> score5 = [37.0, 39.0, 39.0, 42.0, 44.0, 46.0, 47.0, 48.0];
    List<double> score4 = [36.0, 38.0, 38.0, 41.0, 43.0, 45.0, 46.0, 47.0];
    List<double> score4_2 = [32.0, 32.0, 32.0, 34.0, 35.0, 37.0, 37.0, 38.0];
    List<double> score3 = [31.0, 31.0, 31.0, 33.0, 34.0, 36.0, 36.0, 37.0];
    List<double> score3_2 = [25.0, 25.0, 25.0, 25.0, 26.0, 27.0, 27.0, 27.0];
    List<double> score2 = [24.0, 24.0, 24.0, 24.0, 25.0, 26.0, 26.0, 26.0];
    List<double> score2_2 = [19.0, 18.0, 19.0, 16.0, 17.0, 17.0, 17.0, 17.0];

    List<double> score5P = [35.0, 36.0, 38.0, 39.0, 39.0, 40.0, 41.0, 41.0];
    List<double> score4P = [34.0, 35.0, 37.0, 38.0, 38.0, 39.0, 40.0, 40.0];
    List<double> score4_2P = [
      30.0,
      31.0,
      32.0,
      33.0,
      33.0,
      34.0,
      35.0,
      35.0,
    ];
    List<double> score3P = [29.0, 30.0, 31.0, 32.0, 32.0, 33.0, 34.0, 34.0];
    List<double> score3_2P = [24.0, 25.0, 25.0, 26.0, 27.0, 27.0, 28.0, 28.0];
    List<double> score2P = [23.0, 24.0, 24.0, 25.0, 26.0, 26.0, 27.0, 27.0];
    List<double> score2_2P = [18.0, 19.0, 20.0, 20.0, 21.0, 21.0, 21.0, 22.0];
    User? userFirebase = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        age = documentSnapshot.get('age').toString();
        gender = documentSnapshot.get('gender').toString();
        final querySnapshot = await exam5data
            .doc(userFirebase.uid + age)
            .collection(userFirebase.uid)
            .get();
        int ifPenggal1Exist = querySnapshot.docs.length;
        if (ifPenggal1Exist <= 2) {
          for (int i = 0; i < 8; i++) {
            if (agelist[i] == age) {
              if (gender == 'Lelaki') {
                if (jarak >= score5[i]) {
                  score = scorelist[0];
                } else if (jarak <= score4[i] && jarak >= score4_2[i]) {
                  score = scorelist[1];
                } else if (jarak <= score3[i] && jarak >= score3_2[i]) {
                  score = scorelist[2];
                } else if (jarak <= score2[i] && jarak >= score2_2[i]) {
                  score = scorelist[3];
                } else {
                  score = scorelist[4];
                }
              } else if (gender == 'Perempuan') {
                if (jarak >= score5P[i]) {
                  score = scorelist[0];
                } else if (jarak <= score4P[i] && jarak >= score4_2P[i]) {
                  score = scorelist[1];
                } else if (jarak <= score3P[i] && jarak >= score3_2P[i]) {
                  score = scorelist[2];
                } else if (jarak <= score2P[i] && jarak >= score2_2P[i]) {
                  score = scorelist[3];
                } else {
                  score = scorelist[4];
                }
              }
            }
          }
          if (ifPenggal1Exist == 0) {
            exam5data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_1')
                .set({
              'jarak': jarak.toString(),
              'score': score,
            });
          } else if (ifPenggal1Exist == 1) {
            exam5data
                .doc(userFirebase.uid + age)
                .collection(userFirebase.uid)
                .doc('Penggal_2')
                .set({
              'jarak': jarak.toString(),
              'score': score,
            });
          }
        }
      }
    });
  } // Exam 5 melunjur

  Future<void> createClass(String namaKelas) async {
    User? userFirebase = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userFirebase!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        final querySnapshot =
            await kelasData.doc(userFirebase.uid).collection('listKelas').get();
        int ifKelasExist = querySnapshot.docs.length;
        String halfkelasID = '0';
        if (ifKelasExist < 10) {
          halfkelasID = halfkelasID + ifKelasExist.toString();
        } else {
          halfkelasID = ifKelasExist.toString();
        }
        kelasData
            .doc(userFirebase.uid)
            .collection('listKelas')
            .doc(ifKelasExist.toString())
            .set({
          'IDKelas': userFirebase.uid.substring(0, 3) + halfkelasID,
          'NameKelas': namaKelas,
          'Maximum': 30,
        });
      }
      // else {
      //   kelasData.doc(userFirebase.uid).collection('listStudent').doc('0').set({
      //     'ID': namaKelas,
      //     'Maximum': 30,
      //   });
      // }
    });
    // var kk = FirebaseFirestore.instance
    //     .collection('Kelas')
    //     .doc(userFirebase!.uid)
    //     .get()
    //     .then((DocumentSnapshot documentSnapshot) async {
    //   if (documentSnapshot.exists) {
    //     age = documentSnapshot.get('age').toString();
    //     gender = documentSnapshot.get('gender').toString();
    //     final querySnapshot = await exam5data
    //         .doc(userFirebase.uid + age)
    //         .collection(userFirebase.uid)
    //         .get();
    //     int ifPenggal1Exist = querySnapshot.docs.length;
    //     if (ifPenggal1Exist <= 2) {
    //       for (int i = 0; i < 8; i++) {
    //         if (agelist[i] == age) {
    //           if (gender == 'Lelaki') {
    //             if (jarak >= score5[i]) {
    //               score = scorelist[0];
    //             } else if (jarak <= score4[i] && jarak >= score4_2[i]) {
    //               score = scorelist[1];
    //             } else if (jarak <= score3[i] && jarak >= score3_2[i]) {
    //               score = scorelist[2];
    //             } else if (jarak <= score2[i] && jarak >= score2_2[i]) {
    //               score = scorelist[3];
    //             } else {
    //               score = scorelist[4];
    //             }
    //           } else if (gender == 'Perempuan') {
    //             if (jarak >= score5P[i]) {
    //               score = scorelist[0];
    //             } else if (jarak <= score4P[i] && jarak >= score4_2P[i]) {
    //               score = scorelist[1];
    //             } else if (jarak <= score3P[i] && jarak >= score3_2P[i]) {
    //               score = scorelist[2];
    //             } else if (jarak <= score2P[i] && jarak >= score2_2P[i]) {
    //               score = scorelist[3];
    //             } else {
    //               score = scorelist[4];
    //             }
    //           }
    //         }
    //       }
    //       if (ifPenggal1Exist == 0) {
    //         exam5data
    //             .doc(userFirebase.uid + age)
    //             .collection(userFirebase.uid)
    //             .doc('Penggal_1')
    //             .set({
    //           'jarak': jarak.toString(),
    //           'score': score,
    //         });
    //       } else if (ifPenggal1Exist == 1) {
    //         exam5data
    //             .doc(userFirebase.uid + age)
    //             .collection(userFirebase.uid)
    //             .doc('Penggal_2')
    //             .set({
    //           'jarak': jarak.toString(),
    //           'score': score,
    //         });
    //       }
    //     }
    //   }
    // });
  }
}




// var kk = FirebaseFirestore.instance
//             .collection('user')
//             .doc(userFirebase.uid)
//             .get()
//             .then((DocumentSnapshot documentSnapshot2) {
//           if (documentSnapshot2.exists) {
//             String expertiseName =
//                 documentSnapshot.get('expertise_name').toString();
//             if (expertiseName == "beginner") {
//               missionDistance = 3;
//               missionName = "Complete $missionDistance KM";
//               missionDescription = "Player has complete $missionDistance KM.";
//             }
//             if (expertiseName == "intermediate") {
//               missionDistance = 5;
//               missionName = "Complete $missionDistance KM";
//               missionDescription = "Player has complete $missionDistance KM.";
//             }
//             if (expertiseName == "expert") {
//               missionDistance = 8;
//               missionName = "Complete $missionDistance KM";
//               missionDescription = "Player has complete $missionDistance KM.";
//             }
//             for (int i = 0; i < 3; i++) {
//               gardenCollectionMission.doc(uid + i.toString()).set({
//                 'mission_name': missionName,
//                 'mission_description': missionDescription,
//                 'mission_distance': missionDistance,
//                 'mission_status': missionStatus,
//               });
//             }
//           }
//         });


// class DatabaseService {
//   final String uid;
//   DatabaseService({required this.uid});

//   final CollectionReference gardenCollection =
//       FirebaseFirestore.instance.collection('user');

//   Future updateUserData(String email, String username, String password,
//       String expertiseName, int accessLevel) async {
//     return await gardenCollection.doc(uid).set({
//       'email': email,
//       'username': username,
//       'password': password,
//       'expertise_name': expertiseName,
//       'access_level': accessLevel,
//     });
//   }

  // User? userFirebase = FirebaseAuth.instance.currentUser;
  //   var kk = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userFirebase!.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       if (documentSnapshot.get('role') == 1) {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => const BottomNav()),
  //         );
  //       } else if (documentSnapshot.get('role') == 0) {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => Admin()),
  //         );
  //       }
  //     } else {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const UserSignIn()),
  //       );
  //     }
  //   });
  //   return Scaffold(
  //     backgroundColor: background,
  //   );
// }
