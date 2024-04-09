import 'package:flutter/material.dart';

class InstallAppsToEMUIMAGIC extends StatefulWidget {
  const InstallAppsToEMUIMAGIC({super.key});

  @override
  State<InstallAppsToEMUIMAGIC> createState() => _InstallAppsToEMUIMAGICState();
}

class _InstallAppsToEMUIMAGICState extends State<InstallAppsToEMUIMAGIC> {
  final String text = "1. Petal Qidiruv ilovasini oching\n"
      "2. Ilova nomini kiritish uchun Qidiruv panelini bosing , masalan, \“WhatsApp\”.\n"
      "3. Qidiruv natijalarini oling.\n"
      "4. Ilovalar bandini tanlang.\n"
      "5. O'rnatish tugmasini bosing (Apk yuklab olish uchun tegishli veb-saytga yo'naltirilasiz)\n"
      "5. Hozir yuklab olish ga teging .\n"
      "6. Yuklashni tasdiqlang .\n"
      "Yuklab olingandan so'ng, dastur avtomatik ravishda o'rnatishni boshlaydi.\n"
      "Ushbu ko'rsatmalar Apkpure va boshqa uchinchi tomon veb-saytlari uchun bir xil, siz shunchaki \"yuklab olish tugmasini bosishingiz kerak.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        title: Text("Honor va Huawei'da ilovalar o'rnatish"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/home/background.jpg"),fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 12,
            borderRadius: BorderRadius.circular(20),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text),
                ),
                Image.asset("assets/images/installPetal.jpg")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
