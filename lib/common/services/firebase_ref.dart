import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static CollectionReference<Map<String, dynamic>> get technicalFR =>
      _firestore.collection("Technicians");
  static CollectionReference<Map<String, dynamic>> get adminsFR =>
      _firestore.collection("Admins");
  static CollectionReference<Map<String, dynamic>> get requests =>
      _firestore.collection("Requests");
  static CollectionReference<Map<String, dynamic>> get codes =>
      _firestore.collection("Codes");
}
