import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLogin {
  final _auth = FirebaseAuth.instance;

  Future kayitOl(String email, String password) async {
    try {
      //kayıt olmayı dene
      final _giris = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firestoreBilgiKayit(_giris.user);
      return _giris.user;
    } catch (e) {
      // böyle bir hesap varsa giriş yap
      if (e.toString().contains("[firebase_auth/email-already-in-use]")) {
        return _girisYap(email, password);
      } else {
        //böyle bir hesap yoksa hatayı döndür (ve hata kodunu temizle)
        return e.toString().split("] ")[1];
      }
    }
  }

  Future _girisYap(String email, String password) async {
    try {
      final _giris = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _giris.user;
    } catch (e) {
      return e.toString();
    }
  }

  Future firestoreBilgiKayit(User? user) async {
    if (user != null) {
      final fireStore = FirebaseFirestore.instance.collection("Kullanıcılar");
      await fireStore.doc(user.uid).set({"email": user.email});
    }
  }
}
