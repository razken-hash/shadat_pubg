import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shadat_pubg/models/gamer.dart';

class AuthenticationProvider extends ChangeNotifier {
  static final _firebaseAuth = FirebaseAuth.instance;

  static User? get currentUser => _firebaseAuth.currentUser;

  static Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Gamer? gamer;

  void createGamer(User user) {
    gamer = Gamer(
      id: user.uid,
      name: user.displayName ?? "",
      email: user.email ?? "",
      code: "123456",
      shadat: 0,
      picture: user.photoURL ?? "",
    );
  }

  Future<Gamer?> signIn() async {
    Gamer? gamer;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        gamer = Gamer(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? "",
          email: userCredential.user!.email ?? "",
          code: "123456",
          shadat: 0,
          picture: userCredential.user!.photoURL ?? "",
        );
      }
    } on Exception catch (e) {}
    return gamer;
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
