import 'package:flutter/material.dart';

class HowPhonesWork extends StatefulWidget {
  const HowPhonesWork({super.key});

  @override
  State<HowPhonesWork> createState() => _HowPhonesWorkState();
}

class _HowPhonesWorkState extends State<HowPhonesWork> {
  final List<String> texts = [
    "Telefonlar turli mikrosxemalardan tashkil topgan bo'lsa ham ularda Operatsion Tizim(OPERATION SYSTEM) bo'lmasa, hech qanday amal bajara olmaydi.\nOperatsion tizim - telefon ishlashi uchun xizmat qiluvchi dasturlar to'plami. Telefonlar uchun eng mashxur operatsion tizimlar quyidagilar:  \nSeries30,J2ME,Symbian,BlackBeryOS, Windows Mobile, Bada, iOS, Android. ",
    "Series30 - Bu NOKIA kompaniyasi tomonidan ishlab chiqilgan operatsion tizim bo'lib ko'plab, eski NOKIA telefonlarida qo'llangan. NOKIA 1202 telefoni ham Series30 tizimida ishlaydi.",
    "J2Me - JavaMicroEdition. Bu 2008 - yilda hamma Telefonlarga o'rnatilgan. Shu jumladan NOKIA,Siemens,SonyErricson,Samsung kompaniyasining o'rta darajadagi telefonlariga o'rnatilgan. Unga ilova va o'yinlar JAR yoki JAD formatdan o'rnatilgan NOKIA 6300, Siemens CF64, SAMSUNG E2232 telefonlari bunga misol.",
    "Symbian - Symbian haqida eshitmagan odam bo'lmasa kerak. U orqali ishlaydigan telefonlar o'z davrining ayfonlari edi. Juda tez ishlash va qulaylik, o'yinlarda samaradorlik bilan barchani dilidan joy olgan. Residen Evil, Dot2, World of Tanks o'yinlari Kompyuter sifatida ishlar edi. Symbian asosan NOKIA va SonyErricson telefonlariga o'rnatilgan. Ularga misol: NOKIA N79, NOKIA 808PureView.",
    "BlackBeryOS - Bu Tizim BlackBery telefonlariga o'rnatilgan. U ham deyarli kompyuterdek edi. ",
    "Windows Mobile - Bu Microsoft tomonidan ishlab chiqarilgan tizim bo'lib, Microsoft telefonlariga o'rnatiladi. NOKIA smartfonlariga ham o'rnatilgan. NOKIA LUMINA seriyalariga. ",
    "Bada OS - Bu Samsung tominidan ishlab chiqilgan eng tezkor va chiroyli mobile operatsion tizim. U bir vaqtni o'zida J2ME va Android ilovalarnini boshqara olgan. Hamda o'zini ilova kengaytmasi ham bo'lgan. U o'z davrining Huawei'si edi. Samsung Wave Y GT-S5380D LaFleur bunga misol.",
    "iOS - Bu Apple tomonidan ishlab chiqilgan tizim bo'lib, iPhone,iPad, iGlasses, iVision va boshqa mobil qurilmalar va gadjetlarga o'rnatilgan tizim. Bunga oddiy misol: iPhone 15PRO MAX.",
    "Android - Android 2008 - yilda Google tomonidan ishlab chiqilgan eng zo'r operatsion tizim. U Linux yadrosi asosida ishlatilgan tizim bo'lib bizga super-super imkoniatlarni taqdim. Etadi. Agar uda ildiz huquqini olsangiz. LinuxOS ish stoli tizimlarini o'rnatishingiz mumkin. Android Xavfsizligi yuqori va foydalanuvchilarga moslashuvchanligi bois ko'p insonlar sevib qolmoqda. Hozirda SAMSUNG, XIOAOMI, Huawei va boshqa ko'plab qurilmalariga o'rnatilmoqda. Ushbu ilovamiz. Androidni super hususiyatlari haqida ma'lumot beradi.",
  ];
  final List<String> images = [
    "assets/images/oses.png",
    "assets/images/series30.png",
    "assets/images/j2mephones.jpg",
    "assets/images/symbianphones.jpg",
    "assets/images/blackbery.jpg",
    "assets/images/windowsphones.jpg",
    "assets/images/bada.jpg",
    "assets/images/iphone15pro.jpg",
    "assets/images/androidphones.jpg",
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
                  title: Text(texts[index]),
                  subtitle: Center(child: Image.asset(images[index],fit: BoxFit.fill,scale: 2,)),
                ),
              ),
            );
          }),
    );
  }
}
