import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class InstallAppstoOneUI extends StatefulWidget {
  const InstallAppstoOneUI({super.key});

  @override
  State<InstallAppstoOneUI> createState() => _InstallAppstoOneUIState();
}

class _InstallAppstoOneUIState extends State<InstallAppstoOneUI> {
  final List<String> via_file_manager = [
        "I. Fayl menejeri orqali o'rnatish.\n"
        "  1. Fayllarim ilovasini oching.\n",
        "  2. Ichki xotiraga bosing",
        "  3. Yuklanmalar papkasini oching",
        "  4. O'rnatmoqchi bo'lgan ilovaga bosing. Misol: ilova.apk",
        "  5. O'rnatish tugmasini bosing",
        "  6. Noma'lum manbalar xabari chiqsa \nsozlamalar tugmasini bosing, \nchiqmasa o'rnatish tugmasini bosing",
        "  7. Sozlamalarni bosganingizda \nBu manbaga ruhsat berishni yoqib qo'ying",
        "  8. Yoqib qo'yganingizdan keyin \nOrtga qaytib ilovaga yana bosing va o'rnating",
  ];
  final List<String> via_play_store =[
    "II. Ilova do'koni orqali o'rnatish.\n"
        "  1. Play Market (Play Store) ilovasini oching.\n",
        "  2. Yuqoridagi qidiruv paneliga ilova nomini yozib qidiring.\n",
        "  3. Topilgan ilovaga bosing.\n",
        "  4. O'rnatish[Install](Ustanovka) tugmasini bosing.",
        "  5. Ochish[open](otkrit) tugmasini bosing.",
  ];

  final List<String> images_via_file_manager = [
    "assets/images/install_open_file_oneui.jpg",
    "assets/images/install_select_internal_storage_oneui.jpg",
    "assets/images/install_select_download_oneui.jpg",
    "assets/images/install_tap_to_app_oneui.jpg",
    "assets/images/install_tap_to_install_oneui.jpg",
    "assets/images/install_tap_settings_oneui.jpg",
    "assets/images/install_switch_on_oneui.jpg",
    "assets/images/install_installed_oneui.jpg",
  ];

  final List<String> images_via_play_store = [
    "assets/images/open_playstore_oneui.jpg",
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
          title: const Text("OneUIda ilova o'rnatish"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 12,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Text("\nOneUI tizimida ilovalarni 2 hil uslub bilan o'rnatish mumkin.\n"
                    "I. Fayl menejeri orqali o'rnatish.\n"
                    "II. Ilova do'koni orqali o'rnatish.\n\n"),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(child: ListView.builder(
                            itemCount: via_file_manager.length,
                            itemBuilder: (BuildContext context, int index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  elevation: 12,
                                  borderRadius: BorderRadius.circular(20),
                                  child: ListTile(
                                    title: Text(via_file_manager[index]),
                                    subtitle: CircleAvatar(
                                        radius: 100,
                                        child: Image.asset(images_via_file_manager[index])),
                                  ),
                                ),
                              );
                            })),
                        Expanded(child: ListView.builder(
                            itemCount: via_play_store.length,
                            itemBuilder: (BuildContext context, int index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  elevation: 12,
                                  borderRadius: BorderRadius.circular(20),
                                  child: ListTile(
                                    title: Text(via_play_store[index]),
                                    subtitle: CircleAvatar(
                                        radius: 100,
                                        child: Image.asset(images_via_play_store[index])),
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
