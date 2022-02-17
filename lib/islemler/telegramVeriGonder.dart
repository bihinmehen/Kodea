import 'package:http/http.dart' as http;

class TelegramIslemleri {
  Future<List<String>?> veriGonder(
      String isim,
      String gelistirici,
      String surum,
      String platform,
      String applink,
      String logo,
      String payments,
      String docs) async {
    var chatID = "@kodenvanterytbt";
    var token = "5188221961:AAFSOIPNuh8S0LTq-23l8ksRLSsg4NWQuSI";

    var message = "KodEnvanter Uygulama Ekleme Talebi;\n\nUygulama Adı: " +
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
                    return [
                      "Boş alanlar mevcut",
                      "Tüm kutuları eksik doldurduğunuzdan emin olun."
                    ];
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
        return [
          "Başarılı",
          "Uygulama bilgileriniz yöneticilere teslim edildi."
        ];
      }
    }
  }
}
