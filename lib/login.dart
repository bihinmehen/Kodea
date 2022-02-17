import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama/anasayfa.dart';
import 'package:uygulama/islemler/firebase_login.dart';

import 'constants/colors.dart';

Renkler renkler = Renkler();
String _girisHatasi = "";

class LoginWidget extends StatefulWidget {
  LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _epostaController = TextEditingController();

  final TextEditingController _sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kodea",
                    style: TextStyle(
                      fontFamily: "Alatsi",
                      fontSize: 50,
                      color: renkler.koyu,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textBoxW(
                    hint: "E-posta",
                    controller: _epostaController,
                    obfuscate: false,
                    type: TextInputType.emailAddress),
                textBoxW(
                    hint: "Şifre",
                    controller: _sifreController,
                    obfuscate: true,
                    type: TextInputType.text),
              ],
            ),
          ),
          Text(
            _girisHatasi,
            style: TextStyle(
                color: Colors.red[400], fontSize: 18, fontFamily: "Alatsi"),
          ),
          const Expanded(child: SizedBox()),
          Container(
            margin:
                EdgeInsets.only(right: 20, left: Get.width - 230, bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: TextButton(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Giriş Yap"),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: renkler.arkaplan,
                    primary: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 17,
                    )),
                onPressed: () async {
                  dynamic _sonuc = await FirebaseLogin()
                      .kayitOl(_epostaController.text, _sifreController.text);
                  if (_sonuc is String) {
                    setState(() => _girisHatasi =
                        _sonuc.contains("]") ? _sonuc.split("] ")[1] : _sonuc);
                  } else {
                    Get.off(() => AnaSayfa(), arguments: _sonuc);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class textBoxW extends StatelessWidget {
  const textBoxW({
    Key? key,
    required this.hint,
    required this.controller,
    required this.obfuscate,
    required this.type,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final bool obfuscate;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Get.width > 700
          ? const EdgeInsets.symmetric(horizontal: 150, vertical: 15)
          : const EdgeInsets.all(15),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2, color: renkler.koyu),
      ),
      child: TextField(
        keyboardType: type,
        obscureText: obfuscate,
        style: TextStyle(
          fontSize: 20,
          color: renkler.koyu,
        ),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 20,
            color: renkler.orta,
          ),
        ),
      ),
    );
  }
}
