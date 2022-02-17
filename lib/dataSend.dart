import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama/login.dart';
import 'package:http/http.dart' as http;

class dataSend extends StatelessWidget {
  const dataSend({Key? key}) : super(key: key);

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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
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
                            Text("Anasayfa"),
                            SizedBox(
                              width: 1,
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                            //backgroundColor: renkler.acik,
                            primary: renkler.sertkoyu,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Alatsi",
                            )),
                        onPressed: () {
                          // Get.back();
                        },
                      ),
                    ),
                  ],
                ),
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
                      "Uygulama\nPaylaşım\nPaneli",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Alatsi",
                        fontSize: 30,
                        color: renkler.koyu,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//final TextEditingController _isimController = TextEditingController();
//final TextEditingController _gelistiriciController = TextEditingController();
//final TextEditingController _surumController = TextEditingController();
//final TextEditingController _platformController = TextEditingController();
//final TextEditingController _applinkController = TextEditingController();
//final TextEditingController _logoController = TextEditingController();
//final TextEditingController _paymentsController = TextEditingController();
//final TextEditingController _docsController = TextEditingController();
//var isim = _isimController.text
//var gelistirici = _gelistiriciController.text
//var surum = _surumController.text
//var platform = _platformController.text
//var applink = _applinkController.text
//var logo = _logoController.text

//var payments = _paymentsController.text
//var docs = _docsController.text

            textBoxSend("Uygulama Adı", _isimController, ""),
            textBoxSend(
                "Geliştirici Adı", _gelistiriciController, "örn: ByBug Stüdyo"),
            textBoxSend("Uygulama Sürümü", _surumController, "örn: 1.0"),
            textBoxSend("Kod Platformu", _platformController, "örn: Kodular"),
            textBoxSend("Direkt Bağlantı", _applinkController,
                "Direkt indirme bağlantısı"),
            textBoxSend(
                "Kaynak Logo", _logoController, "direkt resim bağlantısı"),
            textBoxSend("Satış Bağlantısı(opsiyonel)", _paymentsController,
                "Kaynak kod satış"),
            textBoxSend("Dökümasyon Bağlantısı(opsiyonel)", _docsController,
                "Github bağlantısı"),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Get.width < 500 ? 50 : 100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: TextButton(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Uygulamayı Gönder",
                          ),
                        ],
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: renkler.sertkoyu,
                        primary: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Alatsi",
                        )),
                    onPressed: () async {
                      var chatID = "@kodenvanterytbt";
                      var token =
                          "5188221961:AAFSOIPNuh8S0LTq-23l8ksRLSsg4NWQuSI";

                      var isim = _isimController.text;
                      var gelistirici = _gelistiriciController.text;
                      var surum = _surumController.text;
                      var platform = _platformController.text;
                      var applink = _applinkController.text;
                      var logo = _logoController.text;
                      var payments = _paymentsController.text;
                      var docs = _docsController.text;
                      var message = "KodEnvanter Uygulama Ekleme Talebi;\n\n" +
                          "Uygulama Adı: " +
                          isim +
                          "\n" +
                          "Geliştirici Adı: " +
                          gelistirici +
                          "\n" +
                          "Uygulama Sürümü: " +
                          surum +
                          "\n" +
                          "Platform Adı: " +
                          platform +
                          "\n" +
                          "AppLink: " +
                          applink +
                          "\n" +
                          "Logo: " +
                          logo +
                          "\n" +
                          "Satış Adresi: " +
                          payments +
                          "\n" +
                          "Dökümasyon: " +
                          docs +
                          "\n" +
                          "\n\nBu istek, web uygulaması üzerinden gönderildi.";

                      if (isim == "") {
                        if (gelistirici == "") {
                          if (surum == "") {
                            if (platform == "") {
                              if (applink == "") {
                                if (logo == "") {
                                  if (payments == "") {
                                    if (docs == "") {
                                      Get.snackbar("Boş alanlar mevcut",
                                              "Tüm kutuları eksik doldurduğunuzdan emin olun.",
                                              backgroundColor: renkler.sertkoyu,
                                              colorText: renkler.baslik)
                                          .show();
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      } else {
                        var url = Uri.parse(
                            "https://api.telegram.org/bot$token/sendmessage?chat_id=$chatID&text=$message");
                        var response = await http.get(
                          url,
                        );

                        if (response.statusCode == 200) {
                          Get.snackbar("Başarılı",
                                  "Uygulama bilgileriniz yöneticilere teslim edildi.",
                                  backgroundColor: renkler.sertkoyu,
                                  colorText: renkler.baslik)
                              .show();
                        }
                      }

                      _applinkController.clear();
                      _docsController.clear();
                      _gelistiriciController.clear();
                      _isimController.clear();
                      _logoController.clear();
                      _paymentsController.clear();
                      _platformController.clear();
                      _surumController.clear();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container textBoxSend(hint, controller, counter) {
    return Container(
      margin: Get.width > 700
          ? const EdgeInsets.symmetric(horizontal: 150, vertical: 5)
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2, color: renkler.koyu),
      ),
      child: TextField(
        cursorColor: renkler.sertkoyu,
        //  keyboardType: type,
        // obscureText: obfuscate,
        style: TextStyle(
          fontSize: 20,
          color: renkler.koyu,
        ),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: counter,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 20,
            color: renkler.sertkoyu,
          ),
        ),
      ),
    );
  }
}
