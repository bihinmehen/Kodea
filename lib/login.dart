import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama/anasayfa.dart';
import 'package:uygulama/islemler/firebaseLogin.dart';

import 'constants/colors.dart';

final Renkler _renkler = Renkler();
String _girisHatasi = "";

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _epostaController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
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
                        color: _renkler.koyu,
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
                  TextBoxW(
                      hint: "E-posta",
                      controller: _epostaController,
                      obfuscate: false,
                      type: TextInputType.emailAddress),
                  TextBoxW(
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
                      backgroundColor: _renkler.arkaplan,
                      primary: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 17,
                      )),
                  onPressed: () async {
                    dynamic _sonuc = await FirebaseLogin()
                        .kayitOl(_epostaController.text, _sifreController.text);
                    if (_sonuc is String) {
                      setState(() => _girisHatasi = _sonuc);
                    } else {
                      Get.off(() => AnaSayfa(), arguments: _sonuc);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextBoxW extends StatelessWidget {
  const TextBoxW({
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
        border: Border.all(width: 2, color: _renkler.koyu),
      ),
      child: TextField(
        keyboardType: type,
        obscureText: obfuscate,
        style: TextStyle(
          fontSize: 20,
          color: _renkler.koyu,
        ),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 20,
            color: _renkler.orta,
          ),
        ),
      ),
    );
  }
}
