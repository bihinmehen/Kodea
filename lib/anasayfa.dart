import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama/constants/colors.dart';
import 'package:uygulama/veriGonder.dart';

class AnaSayfa extends StatelessWidget {
  AnaSayfa({Key? key}) : super(key: key);

  final Renkler _renkler = Renkler();
  //final User _girisBilgileri = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: _renkler.background,
          body: Column(
            children: [
              Container(
                color: _renkler.koyu,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: Text(
                        "KodEnvanter",
                        style: TextStyle(
                          fontFamily: "Alatsi",
                          fontSize: 25,
                          color: _renkler.baslik,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() => VeriGonder());
                            },
                            icon: Icon(
                              Icons.file_upload,
                              color: _renkler.baslik,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 5),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.account_box_rounded,
                              color: _renkler.baslik,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
