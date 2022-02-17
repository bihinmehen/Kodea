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
                  "Bir mağaza, bir platform ve çokça envanter: KodEnvanter!",
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
                      butonlar(text: "Giriş Yap", screenName: LoginWidget()),
                      butonlar(text: "Sosyal Medya", screenName: LoginWidget()),
                      butonlar(text: "Bize Katıl", screenName: LoginWidget()),
                    ],
                  ),
                ),
                Wrap(
                  children: [
                    kutuMesajlar(
                        title: "Neler Yaptık?",
                        subtitle:
                            "Biz bu uygulamada, sizlere DragDrop mağazası, DragDrop Araçları ve Eklentilerini sağladık. Bizi desteklemek için bu web uygulamamızı kullanmaya devam edebilirsiniz! Daha fazla içeriğe erişebilmemiz için geliştirdiğiniz içerikleri bizimle paylaşın, KodEnvanteri yalnız bırakmayın. :')"),
                    kutuMesajlar(
                        title: "Geliştiriciler",
                        subtitle:
                            "Ruwis ve Jea tarafından geliştirilen KodEnvanter, Flutter ve Dart ile geliştirildi. İçerikler ise sizin gibi insanlar tarafından geliştiriliyor. İlerleyen zamanlarda Telegram gibi platformlarda aktif olabilmek adına Python ile müthiş botlarımız sizlere hizmet verecek!"),
                    kutuMesajlar(
                        title: "Fiyatlandırma",
                        subtitle:
                            "Geliştiriciler, içeriklerini veya ürünlerini, ücretli-üretsiz olarak yayınlayabilir. KodEnvanter hiç bir satın almayı desteklemez. Satın almayı destekleyen bankalar ile çalışan geliştiriciler, KodEnvantere yalnızca bağış veya satın alım bağlantısı verebilir. Daha fazla bilgi için YouTube kanalımıza bakın."),
                    kutuMesajlar(
                        title: "DragDrop Nedir?",
                        subtitle:
                            "DragDrop, farklı yazılım dilleri için bir çeşit görsel kodlama yöntemidir. Biz bu serviste Java destekli Kodular, AppInventor veya Thunkable gibi platformları destekliyoruz. Java ile Android uygulamalar geliştiriliyor. Bu servisimiz, Android işletim sistemlerine çalışacak şekilde tasarlandı.")
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
