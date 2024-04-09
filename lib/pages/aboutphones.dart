import 'package:flutter/material.dart';

class AboutPhone extends StatelessWidget {
  const AboutPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
        title: const Text("Telefonlar haqida umumiy ma'lumot",),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/home/background.jpg"))
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 12,
            child: ListTile(
              title: const Text("Telefonlar haqida umumiy ma'lumot",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              subtitle: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Image.asset("assets/images/aboutphone.png"),
                  Text(style: TextStyle(fontSize: 20),
                      "\nTelefon[Zamonaviy nomi smartfon]\nSmartfonlar mobil telefonning funksionalligini ilg’or hisoblash qobiliyatlari bilan birlashtirgan qurilmalar. Ular sensorli ekranli interfeysga ega bo’lib, foydalanuvchilarga veb-sahifalar, elektron pochta va ijtimoiy tarmoqlar, shuningdek, multimedia tinglash va oqimlar kabi keng ko’lamli ilovalar va xizmatlardan foydalanish imkonini beradi. Smartfonlar eski dizayndagi telefonlardan o‘zining ilg‘or apparat imkoniyatlari va keng ko‘lamli mobil operatsion tizimlari, internetga kirish, biznes ilovalari, mobil to‘lovlar va multimedia funksiyalari, jumladan musiqa, video, o‘yin, radio va televizor bilan ajralib turadi.\n\nSmartfonlar odatda bir qator metall-oksid-yarim o’tkazgichli (MOS) integral mikrosxemalar (IC) mikrosxemalarini o’z ichiga oladi, ular oldindan o’rnatilgan va uchinchi tomon dasturlari (masalan, magnitometr, yaqinlik sensori, barometr) tomonidan ishlatilishi mumkin bo’lgan turli sensorlarni o’z ichiga oladi. giroskop, akselerometr va boshqalar) va turli xil simsiz aloqa protokollarini (masalan, LTE, 5G NR, Wi-Fi, Bluetooth va sun’iy yo’ldosh navigatsiyasi) qo’llab-quvvatlaydi.\n\n2020-yillarning o’rtalarida smartfon ishlab chiqaruvchilari ishonchli uyali aloqa tarmog’i mavjud bo’lmagan uzoq hududlarda foydalanish uchun sun’iy yo’ldosh xabar almashish va sun’iy yo’ldosh favqulodda xizmatlarini qurilmalarga integratsiyalashni boshladilar. 2014 yil holatiga ko’ra, har yili dunyo bo’ylab milliarddan ortiq smartfon sotiladi. Birgina 2019 yilning o‘zida dunyo bo‘ylab 1,54 milliard dona smartfon yetkazib berildi. 2020 yil holatiga ko’ra dunyo aholisining 75,05 foizi smartfon foydalanuvchilari bo’lgan.\n\nTelefonlar bugungi kunda barchamizga uzoqni yaqin, og'irni yengil qiluvchi bir ixcham yordamchi, raqamli do'stga aylanib qoldi. Telefon bilan ishlash bo'yicha bilim va tajribalar turli kishilar turlichadir. Bazi bir foydalanuvchilar telefonda mukammal foydalanib, qurilmasidan 5 - 7 yil foydalanayotgan bo'lsa, bazi foydalanuvchilar esa, 1 - 2 yilda telefon samaradorligi tushib ketishi, Sekin ishlash, tizimdan chiqish, xotira to'lib qolishi, batareya tez sarf bo'lishi kabi bir qancha muammolardan aziyat chekmoqdalar. Ushbu telefon sirlari nomli kichik ilovamizda. Barcha muammolarga yechim topishga harakat qildik. Ushbu ilovaning 40ta bo'limdan iborat xizmatlarni taqdim etdik. Ehtiyojingizga qarab, mos bilimlarni o'rganishingiz mumkin.\n\n"),
                SizedBox(height: 12,)
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
