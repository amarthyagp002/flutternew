import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<String> signup(
      {required String email,
      required String password,
      required String name,
      String? role,
      int? value}) async {
    String res = "Something went wrong";
    try {
      UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (value == 1) {
        _firestore.collection('users').doc(cred.user!.uid).set(
            {"name": name, "email": email, "password": password, 'role': role});
      } else if (value == 0) {
        _firestore.collection('staff').doc(cred.user!.uid).set(
            {"name": name, "email": email, "password": password, 'role': role});
      }
      res = "success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  static Future<String> login(
      {required String email, required String password}) async {
    String res = "";
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      res = "success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  static Future<List> getUser() async {
    try {
      final doc = await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      if (doc.data() != null) {
        String name = doc.data()!["name"];
        String email = doc.data()!["email"];

        return ["success", name, email];
      }
    } catch (e) {
      return [e.toString()];
    }
    return ["failed"];
  }

  static Future<String> logout() async {
    String res = "Something went wrong";
    try {
      await _firebaseAuth.signOut();
      res = "success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  static bool isUserLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  static Future<String> getRole() async {
    String res = "something went wrong";
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      final data =
          await FirebaseFirestore.instance.collection('staff').doc(uid).get();
      final data1 =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (data.data() != null) {
        res = data.data()!['role'];
      } else {
        res = data1.data()!['role'];
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
