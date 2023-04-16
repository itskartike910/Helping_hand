import 'package:cloud_firestore/cloud_firestore.dart';

class Alert {
  final String username;
  final String locationNickname;
  final List address;
  final String uid;
  final datePublished;

  const Alert({
    required this.locationNickname,
    required this.address,
    required this.username,
    required this.uid,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'locationNickname': locationNickname,
        'address': address,
        'uid': uid,
        'datePublished': datePublished,
      };

  static Alert fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Alert(
      username: snapshot['username'],
      locationNickname: snapshot['locationNickname'],
      address: snapshot['address'],
      uid: snapshot['uid'],
      datePublished: snapshot['datePublished'],
    );
  }
}
