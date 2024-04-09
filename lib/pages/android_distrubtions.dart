import 'package:flutter/material.dart';

class AndroidDistrubtions extends StatefulWidget {
  const AndroidDistrubtions({super.key});

  @override
  State<AndroidDistrubtions> createState() => _AndroidDistrubtionsState();
}

class _AndroidDistrubtionsState extends State<AndroidDistrubtions> {
  final List<String> texts = [
    "Android qobiqlar turli kompaniyalar tomonidan o'zgartirilgan Android tarqatilishidir. U foydalanuvchilarga yangi interfeys va funksiyalarni beradi.\n\n"
    "OneUI - Bu Samsung'ning Android tarqatishi bo'lib u Android 9 va undan telefonlarga o'rnatilmoqda.",
    "Samsung Exprience Home - Samsungni Android 7 va 8 versiyada ishlaydigan qurilmalarida bor.",
    "TouchWith - Samsungning Android 4 dan Android 6 gacha versiyadagi telefonlarida bor.",
    "Pixel UI - Google Piksel telefonlariga o'rnatiladigan tarqatish. Lekin siz mediatek chipseti bilan jihozlangan ko'plab qurilmalarda ko'rishingiz mumkin. Masalan: Artel Quadro Pro, Infinix telefonlari va boshqa arzon telefonlarda. Google Piksel telefonlari arzon emas,",
    "MIUI - Bu Redmi, Poco, Mi telefonlariga o'rnatilgan.",
    "EMUI - Bu huawei telefonlariga o'rnatiladi.",
    "MagicUI - Bu Eng yangi Huawei va Honor telefonlariga o'rnatilgan.",
    "LineageOS, CorvusOS, BlissOS, HavocOS kabi qobiqlar bor. Ular eng tezkor qobiqlar bo'lib ular, maxsus superuserlar va gamerlar uchun mo'jjallangan. ",
  ];
  final List<String> images = [
    "assets/images/one_ui.jpg",
    "assets/images/samsung_eh.jpg",
    "assets/images/touch_with.jpg",
    "assets/images/pixel_ui.png",
    "assets/images/miui.jpg",
    "assets/images/emui.jpg",
    "assets/images/magicui.jpg",
    "assets/images/custom.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
        title: Text("Telefonlar qanday ishlaydi"),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: texts.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Material(
                elevation: 12,
                child: ListTile(
                  titleTextStyle: TextStyle(color: Colors.black,fontSize: 25),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(texts[index]),
                  ),
                  subtitle: Container(
                      height: MediaQuery.of(context).size.height/3,
                      child: Image.asset(images[index],fit: BoxFit.contain,scale: 3,)),
                ),
              ),
            );
          }),
    );
  }
}
