import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseLogin {
  final _auth = FirebaseAuth.instance;

  Future kayitOl(String email, String password) async {
    try {
      //kayıt olmayı dene
      final _giris = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _giris.user;
    } catch (e) {
      // böyle bir hesap varsa giriş yap
      if (e.toString().contains("[firebase_auth/email-already-in-use]")) {
        return _girisYap(email, password);
      } else {
        //böyle bir hesap yoksa hatayı döndür
        return e.toString();
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
}
