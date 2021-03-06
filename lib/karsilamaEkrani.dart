import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama/constants/colors.dart';
import 'package:uygulama/login.dart';

class KarsilamaEkrani extends StatelessWidget {
  KarsilamaEkrani({Key? key}) : super(key: key);

  Renkler _renkler = Renkler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: _renkler.koyu,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.library_books,
                          color: _renkler.baslik,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.science,
                          color: _renkler.baslik,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.store,
                          color: _renkler.baslik,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "KodEnvanter",
                  style: TextStyle(
                    fontFamily: "Alatsi",
                    fontSize: Get.width < 350
                        ? 35
                        : Get.width < 500
                            ? 40
                            : 40,
                    color: _renkler.koyu,
                  ),
                ),
                Text(
                  "Bir ma??aza, bir platform ve ??ok??a envanter: KodEnvanter!",
                  style: TextStyle(
                    fontFamily: "BellotaText",
                    fontSize: Get.width < 350
                        ? 10
                        : Get.width < 500
                            ? 14
                            : 16,
                    fontStyle: FontStyle.italic,
                    color: _renkler.koyu,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      //Button
                      butonlar(text: "Giri?? Yap", screenName: LoginWidget()),
                      butonlar(text: "Sosyal Medya", screenName: LoginWidget()),
                      butonlar(text: "Bize Kat??l", screenName: LoginWidget()),
                    ],
                  ),
                ),
                Wrap(
                  children: [
                    kutuMesajlar(
                        title: "Neler Yapt??k?",
                        subtitle:
                            "Biz bu uygulamada, sizlere DragDrop ma??azas??, DragDrop Ara??lar?? ve Eklentilerini sa??lad??k. Bizi desteklemek i??in bu web uygulamam??z?? kullanmaya devam edebilirsiniz! Daha fazla i??eri??e eri??ebilmemiz i??in geli??tirdi??iniz i??erikleri bizimle payla????n, KodEnvanteri yaln??z b??rakmay??n. :')"),
                    kutuMesajlar(
                        title: "Geli??tiriciler",
                        subtitle:
                            "Ruwis ve Jea taraf??ndan geli??tirilen KodEnvanter, Flutter ve Dart ile geli??tirildi. ????erikler ise sizin gibi insanlar taraf??ndan geli??tiriliyor. ??lerleyen zamanlarda Telegram gibi platformlarda aktif olabilmek ad??na Python ile m??thi?? botlar??m??z sizlere hizmet verecek!"),
                    kutuMesajlar(
                        title: "Fiyatland??rma",
                        subtitle:
                            "Geli??tiriciler, i??eriklerini veya ??r??nlerini, ??cretli-??retsiz olarak yay??nlayabilir. KodEnvanter hi?? bir sat??n almay?? desteklemez. Sat??n almay?? destekleyen bankalar ile ??al????an geli??tiriciler, KodEnvantere yaln??zca ba?????? veya sat??n al??m ba??lant??s?? verebilir. Daha fazla bilgi i??in YouTube kanal??m??za bak??n."),
                    kutuMesajlar(
                        title: "DragDrop Nedir?",
                        subtitle:
                            "DragDrop, farkl?? yaz??l??m dilleri i??in bir ??e??it g??rsel kodlama y??ntemidir. Biz bu serviste Java destekli Kodular, AppInventor veya Thunkable gibi platformlar?? destekliyoruz. Java ile Android uygulamalar geli??tiriliyor. Bu servisimiz, Android i??letim sistemlerine ??al????acak ??ekilde tasarland??.")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding butonlar({required String text, required Widget screenName}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width < 500 ? 50 : 100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                ),
              ],
            ),
            style: TextButton.styleFrom(
                backgroundColor: _renkler.sertkoyu,
                primary: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Alatsi",
                )),
            onPressed: () {
              Get.to(() => screenName);
            },
          ),
        ),
      ),
    );
  }

  Padding kutuMesajlar({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: _renkler.orta,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 2, color: _renkler.koyu),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: _renkler.background,
                  fontSize: 16,
                  fontFamily: "Alatsi"),
            ),
            SizedBox(
              width: 200,
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: _renkler.background,
                    fontSize: 14,
                    fontFamily: "BellotaText"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
