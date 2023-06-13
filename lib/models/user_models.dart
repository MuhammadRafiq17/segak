// class Destination {
//   final String image;
//   final String name;
//   final String price;
//   final String location;

//   Destination(this.image, this.name, this.price, this.location);
// }

class Users {
  final String uid;
  final String name;
  final String email;
  final String phone;
  //final int access_level;
  final String gender;
  final String age;
  final String usertype;

  Users({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    //required this.access_level,
    required this.gender,
    required this.age,
    required this.usertype,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        //'access_level': access_level,
        'gender': gender,
        'age': age,
        'usertype': usertype,
      };

  static Users fromJson(Map<String, dynamic> data) => Users(
      uid: data['uid'],
      name: data['name'],
      phone: data['phone'],
      email: data['email'],
      //access_level: data['access_level'],
      gender: data['gender'],
      age: data['age'],
      usertype: data['usertype']);
}
