import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama/karsilamaEkrani.dart';
import 'package:uygulama/login.dart';
import 'package:uygulama/veriGonder.dart';
import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBGMDi-EWtlWiHF6V5aZfAjKMW-w5_81UM",
          authDomain: "kodea-d02ac.firebaseapp.com",
          projectId: "kodea-d02ac",
          storageBucket: "kodea-d02ac.appspot.com",
          messagingSenderId: "375437205399",
          appId: "1:375437205399:web:a4548f94448c079ca52ed2"));
  runApp(MyApp());
}

Renkler renkler = Renkler();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kodea',
      home: Scaffold(
        backgroundColor: renkler.background,
        body: KarsilamaEkrani(),
      ),
    );
  }
}
