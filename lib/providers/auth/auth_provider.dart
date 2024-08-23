import 'dart:math';
import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shadat_pubg/models/gamer.dart';

class AuthenticationProvider extends ChangeNotifier {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _firebaseStore = FirebaseFirestore.instance;

  static User? get currentUser => _firebaseAuth.currentUser;

  static Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Gamer? gamer;

  Future<Gamer?> createGamer(User user) async {
    final DocumentReference document =
        _firebaseStore.collection("gamers").doc(user.uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      if (snapshot.exists) {
        dynamic data = snapshot.data();
        gamer = Gamer(
          id: data["id"],
          name: data["name"],
          email: data["email"],
          code: data["code"],
          points: data["points"],
          picture: data["picture"],
        );
        // notifyListeners();
      } else {
        gamer = Gamer(
          id: user.uid,
          name: user.displayName!,
          email: user.email!,
          picture: user.photoURL!,
          points: 0,
          code: (Random().nextInt(9999999) + 1000000).toString(),
        );
        await createGamerOnFirebase(gamer!);
      }
    });
    return gamer;
  }

  Future<void> createGamerOnFirebase(Gamer gamer) async {
    final DocumentReference document =
        _firebaseStore.collection("gamers").doc(gamer.id);
    await document.set(
      {
        'id': gamer.id,
        'name': gamer.name,
        'email': gamer.email,
        'code': gamer.code,
        'points': gamer.points,
        'picture': gamer.picture,
      },
    );
  }

  void updatePoints({required int points}) async {
    gamer!.points += points;
    final DocumentReference document =
        _firebaseStore.collection("gamers").doc(gamer!.id);
    await document.update({"points": gamer!.points});
    notifyListeners();
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
        gamer = await createGamer(userCredential.user!);
      }
    } on Exception catch (e) {
      dev.log(e.toString());
    }
    return gamer;
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      gamer = null;
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
