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
  final String gender;
  final String age;
  final String usertype;

  Users({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.age,
    required this.usertype,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'gender': gender,
        'age': age,
        'usertype': usertype,
      };

  static Users fromJson(Map<String, dynamic> data) => Users(
      uid: data['uid'],
      name: data['name'],
      phone: data['phone'],
      email: data['email'],
      gender: data['gender'],
      age: data['age'],
      usertype: data['usertype']);
}
