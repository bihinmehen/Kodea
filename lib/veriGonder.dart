import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama/islemler/telegramVeriGonder.dart';

import 'constants/colors.dart';

class VeriGonder extends StatefulWidget {
  VeriGonder({Key? key}) : super(key: key);

  @override
  State<VeriGonder> createState() => _VeriGonderState();
}

class _VeriGonderState extends State<VeriGonder> {
  final Renkler _renkler = Renkler();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _isimController = TextEditingController();
    final TextEditingController _gelistiriciController =
        TextEditingController();
    final TextEditingController _surumController = TextEditingController();
    final TextEditingController _platformController = TextEditingController();
    final TextEditingController _applinkController = TextEditingController();
    final TextEditingController _logoController = TextEditingController();
    final TextEditingController _paymentsController = TextEditingController();
    final TextEditingController _docsController = TextEditingController();

//var payments = _paymentsController.text
//var docs = _docsController.text
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: TextButton(
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 1,
                            ),
                            Icon(Icons.arrow_back_ios_new),
                            Text("Ana Sayfa"),
                            SizedBox(
                              width: 1,
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                            //backgroundColor: renkler.acik,
                            primary: _renkler.sertkoyu,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Alatsi",
                            )),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Uygulamanı Paylaş",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Alatsi",
                          fontSize: 30,
                          color: _renkler.koyu,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              textBoxSend("Uygulama Adı", _isimController, ""),
              textBoxSend("Geliştirici Adı", _gelistiriciController,
                  "örn: ByBug Stüdyo"),
              textBoxSend("Uygulama Sürümü", _surumController, "örn: 1.0"),
              textBoxSend("Kod Platformu", _platformController, "örn: Kodular"),
              textBoxSend("Direkt Bağlantı", _applinkController,
                  "Direkt indirme bağlantısı"),
              textBoxSend(
                  "Kaynak Logo", _logoController, "Direkt resim bağlantısı"),
              textBoxSend("Satış Bağlantısı(opsiyonel)", _paymentsController,
                  "Kaynak kod satış"),
              textBoxSend("Dökümasyon Bağlantısı(opsiyonel)", _docsController,
                  "Github bağlantısı"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width < 500 ? 50 : 100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Uygulamayı Gönder",
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: _renkler.sertkoyu,
                          primary: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Alatsi",
                          )),
                      onPressed: () async {
                        final result = await TelegramIslemleri().veriGonder(
                            _isimController.text,
                            _gelistiriciController.text,
                            _surumController.text,
                            _platformController.text,
                            _applinkController.text,
                            _logoController.text,
                            _paymentsController.text,
                            _docsController.text);

                        if (result != null) {
                          setState(() {
                            Get.snackbar(result[0], result[1],
                                    backgroundColor: _renkler.sertkoyu,
                                    colorText: _renkler.baslik)
                                .show();
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container textBoxSend(hint, controller, counter) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      margin: Get.width > 700
          ? const EdgeInsets.symmetric(horizontal: 150, vertical: 5)
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: _renkler.koyu, width: 2)),
      child: TextField(
        cursorColor: _renkler.sertkoyu,
        style: TextStyle(
          fontSize: 18,
          color: _renkler.koyu,
        ),
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: counter,
            hintStyle: TextStyle(
              fontSize: 16,
              color: _renkler.sertkoyu,
            ),
            labelText: hint,
            labelStyle: TextStyle(color: _renkler.orta)),
      ),
    );
  }
}
