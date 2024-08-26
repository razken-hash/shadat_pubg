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
          turns: data["turns"],
          goldenBoxGiftDate: data["goldenBoxGiftDate"].toDate(),
          dailyPriseDate: data["dailyPriseDate"].toDate(),
          picture: data["picture"],
        );
        // notifyListeners();
      } else {
        gamer = Gamer(
          id: user.uid,
          name: user.displayName!,
          email: user.email!,
          picture: user.photoURL!,
          code: (Random().nextInt(9999999) + 1000000).toString(),
          goldenBoxGiftDate: DateTime(2000),
          dailyPriseDate: DateTime(2000),
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
        'turns': gamer.turns,
        'picture': gamer.picture,
        'goldenBoxGiftDate': gamer.goldenBoxGiftDate,
        'dailyPriseDate': gamer.dailyPriseDate,
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

  void updateTurns({required int turns}) async {
    gamer!.turns += turns;
    final DocumentReference document =
        _firebaseStore.collection("gamers").doc(gamer!.id);
    await document.update({"turns": gamer!.turns});
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

  Future<bool> getGoldenBoxGift() async {
    if (DateTime.now().difference(gamer!.goldenBoxGiftDate).inDays >= 1 &&
        DateTime.now().isAfter(gamer!.goldenBoxGiftDate)) {
      gamer!.goldenBoxGiftDate = DateTime.now();
      final DocumentReference document =
          _firebaseStore.collection("gamers").doc(gamer!.id);
      await document.update({"goldenBoxGiftDate": gamer!.goldenBoxGiftDate});
      updatePoints(points: 1);
      return true;
    }
    return false;
  }

  Future<bool> getDailyPrise({required int prise}) async {
    if (DateTime.now().difference(gamer!.dailyPriseDate).inDays >= 1 &&
        DateTime.now().isAfter(gamer!.dailyPriseDate)) {
      gamer!.dailyPriseDate = DateTime.now();
      final DocumentReference document =
          _firebaseStore.collection("gamers").doc(gamer!.id);
      await document.update({"dailyPriseDate": gamer!.dailyPriseDate});
      updatePoints(points: prise);
      return true;
    }
    return false;
  }

  bool get canTurnWheel => gamer!.turns > 0;
}
