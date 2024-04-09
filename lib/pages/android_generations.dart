import 'package:flutter/material.dart';

class AndroidGenerations extends StatefulWidget {
  const AndroidGenerations({super.key});

  @override
  State<AndroidGenerations> createState() => _AndroidGenerationsState();
}

class _AndroidGenerationsState extends State<AndroidGenerations> {
  final String title = "Android Bugungi kunda 14 ta avloddan iborat. ozirda eng so'nggi versiyasi Android 14 Down Cake bo'lmoqda.\n"
      "Android avlodlari va ismlari:";
  final List<String>texts = [
    "Android 1.0 BASE",
    "Android 2.0 Eclair",
    "Android 3.0 HoneyComp",
    "Android 4.0 JellyBean",
    "Android 5.0 Lollipop",
    "Android 6.0 Marshmallow",
    "Android 7.0 Noughat",
    "Android 8.0 Oreo",
    "Android 9.0 Pie",
    "Android 10 Quen Cake",
    "Android 11 Red Vavelt Cake",
    "Android 12 Snow Cone",
    "Android 13 Teramisu",
    "Android 14 DownCake",
  ];
  final List<String>images = [
    "assets/images/android_1.0.jpg",
    "assets/images/android_2.0.jpg",
    "assets/images/android_3.0.jpg",
    "assets/images/android_4.0.jpg",
    "assets/images/android_5.0.jpg",
    "assets/images/android_6.0.jpg",
    "assets/images/android_7.0.jpg",
    "assets/images/android_8.0.jpg",
    "assets/images/android_9.0.jpg",
    "assets/images/android_10.jpg",
    "assets/images/android_11.jpg",
    "assets/images/android_12.jpg",
    "assets/images/android_13.jpg",
    "assets/images/android_14.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
        title: const Text("Android avlodlari"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/home/background.jpg"))
        ),
        child: SingleChildScrollView( // SingleChildScrollView qo'shildi
          child: Column(
            children: <Widget>[
              Material(
                  elevation: 12,
                  child: Text(title)),
              GridView.builder(
                shrinkWrap: true,
                // shrinkWrap: true qo'shildi
                physics: NeverScrollableScrollPhysics(),
                // physics: NeverScrollableScrollPhysics() qo'shildi
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: texts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 12,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                texts[index],
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                images[index], fit: BoxFit.fill,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
