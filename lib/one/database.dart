import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String name, String code) async {
    try {
      await firestore.collection("users").add({
        'name': name,
        'job': code,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("users").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('users').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "name": doc['name'], "job": doc["job"]};
          docs.add(a);
        }
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> update(String id, String name, String job) async {
    try {
      await firestore
          .collection("users")
          .doc(id)
          .update({'name': name, 'job': job});
    } catch (e) {
      print(e);
    }
  }
}
