import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Successful registration!";
    } catch (e) {
      return e.toString();
    }
  }

  // Assuming you have a Users collection in Firestore with a document for each user identified by their UID

  Future<void> updateUser(String name, String password) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Update user name in Firestore
      final uid = user.uid;
      final docRef = FirebaseFirestore.instance.collection('Users').doc(uid);
      await docRef.update({
        'name': name,
      });

      // Update password if provided
      if (password.isNotEmpty) {
        await user.updatePassword(password);
      }
    }
  }


  Future<void> logout() async {
    await _auth.signOut();
  }
}
