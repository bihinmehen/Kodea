import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnaSayfa extends StatelessWidget {
  AnaSayfa({Key? key}) : super(key: key);

  final User _girisBilgileri = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(_girisBilgileri.email.toString()),
        ),
      ),
    );
  }
}
