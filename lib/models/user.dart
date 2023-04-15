import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String locationNickname;
  final List address;

  const User({
    required this.locationNickname,
    required this.address,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'locationNickname': locationNickname,
        'address': address,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      locationNickname: snapshot['locationNickname'],
      address: snapshot['address'],
    );
  }
}
