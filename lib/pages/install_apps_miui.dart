import 'package:flutter/material.dart';
class InstallAppstoMiUi extends StatefulWidget {
  const InstallAppstoMiUi({super.key});

  @override
  State<InstallAppstoMiUi> createState() => _InstallAppstoMiUiState();
}

class _InstallAppstoMiUiState extends State<InstallAppstoMiUi> {
  final List<String> viaFileManager = [
        "I. Fayl menejeri orqali o'rnatish.\n"
        "  1. Sozlamalar ilovasini oching.\n",
        "  2. Maxfiylikni himoya qilish bo'limini oching.\n",
        "  3. Maxsus ruhsatlar bo'limini oching.\n",
        "  4. Noma'lum ilovalarni o'rnatish bo'limini oching.\n",
        "  5. Ro'yxatdan Fayl menejeri bo'limini toping va oching.\n",
        "  6. Bu manbaaga ruhsat berishi yoqing.\nXavfli oynasi chiqsa rozilik belgisini qo'ying va OK'ni bosing(AslidaXavfsizdir)\n",
        "  7. Asosiy oynaga qayting va Fayllarim ilovasini oching.\n",
        "  8. O’rnatishni istagan ilovangizning .apk faylini toping.\n",
        "  9. Ushbu faylni tanlang va o’rnatish tugmasini bosing. \n",
  ];
  final List<String> viaPlayStore =[
    "II. Ilova do'koni orqali o'rnatish.\n"
        "  1. Play Market (Play Store) ilovasini oching.\n",
        "  2. Yuqoridagi qidiruv paneliga ilova nomini yozib qidiring.\n",
        "  3. Topilgan ilovaga bosing.\n",
        "  4. O'rnatish[Install](Ustanovka) tugmasini bosing.",
        "  5. Ochish[open](otkrit) tugmasini bosing.",
  ];
  
  final List<String> imagesViaFileManager = [
    "assets/images/install_open_settings_app_miui.jpg",
    "assets/images/install_select_privacy_protection_miui.jpg",
    "assets/images/install_select_special_permissions_miui.jpg",
    "assets/images/install_select_unkhnown_apps_miui.jpg",
    "assets/images/install_switch_unkhnown_apps_mui.jpg",
    "assets/images/install_OK_danger_miui.jpg",
    "assets/images/install_find_apk_miui.jpg",
    "assets/images/install_tap_install_miui.jpg",
    "assets/images/install_installed_miui.jpg",
  ];

  final List<String> imagesViaPlayStore = [
    "assets/images/open_playstore_miui.jpg",
    "assets/images/search.jpg",
    "assets/images/select.jpg",
    "assets/images/install.jpg",
    "assets/images/opennewapp.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          title: const Text("MIUIda ilova o'rnatish"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 12,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                const Text("\nMIUI tizimida ilovalarni 2 hil uslub bilan o'rnatish mumkin.\n"
                    "I. Fayl menejeri orqali o'rnatish.\n"
                    "II. Ilova do'koni orqali o'rnatish.\n\n"),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(child: ListView.builder(
                            itemCount: viaFileManager.length,
                            itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 12,
                              borderRadius: BorderRadius.circular(20),
                              child: ListTile(
                                title: Text(viaFileManager[index]),
                                subtitle: CircleAvatar(
                                    radius: 100,
                                    child: Image.asset(imagesViaFileManager[index])),
                              ),
                            ),
                          );
                        })),
                        Expanded(child: ListView.builder(
                            itemCount: viaPlayStore.length,
                            itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 12,
                              borderRadius: BorderRadius.circular(20),
                              child: ListTile(
                                title: Text(viaPlayStore[index]),
                                subtitle: CircleAvatar(
                                    radius: 100,
                                    child: Image.asset(imagesViaPlayStore[index])),
                              ),
                            ),
                          );
                        })),
            
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
