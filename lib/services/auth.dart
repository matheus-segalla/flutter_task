// import 'package:firebase_auth/firebase_auth.dart';
//
// class Auth {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   User? get currentUser => _auth.currentUser;
//
//   String? getCurrentUserId() {
//     final user = _auth.currentUser;
//     return user != null ? user.uid : null;
//   }
//   Future<void> registerWithEmailAndPassword(
//       String email, String password) async {
//     final user = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }
//   Future<String> getCurrentUID() async {
//     return (await _auth.currentUser!).uid;
//   }
//   Future<void> signInWithEmailAndPassword(
//       String email,
//       String password
//       ) async {
//     final user = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/HomeScreen.dart';
import '../screens/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return HomeScreen();
          }

          // user is NOT logged in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}