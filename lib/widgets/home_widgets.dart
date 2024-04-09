import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../pages/aboutphones.dart';
import '../pages/android_distrubtions.dart';
import '../pages/android_generations.dart';
import '../pages/how_phones_work.dart';

class BannerIcon extends StatelessWidget {
  const BannerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/3,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/home/icon.jpg"))
      ),
    );
  }
}

class PhoneInterface extends StatefulWidget {
  const PhoneInterface({super.key});

  @override
  State<PhoneInterface> createState() => _PhoneInterfaceState();
}

class _PhoneInterfaceState extends State<PhoneInterface> {
  List<String> images=[
    "assets/home/s1c1.jpg",
    "assets/home/s1c2.jpg",
    "assets/home/s1c3.jpg",
    "assets/home/s1c4.jpg",
  ];
  List<String> texts=[
    "  Telefonlar haqida umumiy ma'lumot",
    "  Telefonlar qanday ishlaydi",
    "  Android avlodlari",
    "  Android qobiqlar",
  ];
  List<Widget Function()> links = [
        () => const AboutPhone(),
        () => const HowPhonesWork(),
        () => const AndroidGenerations(),
        () => const AndroidDistrubtions(),
  ];

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("   Telefon interfeysi   ",style: TextStyle(backgroundColor: Colors.black45,color: Colors.white,fontSize: 25),),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.red,
                  elevation: 14,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  context: context,
                  isScrollControlled: true, // Bu oynani ekranga to'liq chiqaradi
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // Bu oynani ekranga to'liq chiqaradi
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.white,
                       ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                               CircleAvatar(
                                 radius: 25,
                                 backgroundColor: Colors.red.shade100,
                                 child: CloseButton(onPressed: (){
                                   Navigator.pop(context);
                                 },
                                 color: Colors.red,
                                 ),
                               )
                              ],
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: images.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context, int index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>links[index]()));
                                        },
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.green.withOpacity(1),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3), // shadow position
                                                ),
                                              ],

                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(images[index])),
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.blue
                                          ),
                                          child: FittedBox(fit: BoxFit.contain,child: Text(texts[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),)),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )
                      ),
                    );
                  },
                );
              },
            color: Colors.blue.shade200, child: const Row(
            children: [
              Text("Telefon interfeysi haqida batafsil",style: TextStyle(fontSize: 20,color: Colors.black),),
              Icon(Icons.arrow_right_alt)
            ],
          ),),
        ],
      ),
    );
  }
}

class IsOne extends StatefulWidget {
  const IsOne({super.key});

  @override
  IsOneState createState() => IsOneState();
}

class IsOneState extends State<IsOne> {
  List<String> images=[
    "assets/home/s1c1.jpg",
    "assets/home/s1c2.jpg",
    "assets/home/s1c3.jpg",
    "assets/home/s1c4.jpg",
  ];
  List<String> texts=[
    "  Telefonlar haqida umumiy ma'lumot",
    "  Telefonlar qanday ishlaydi",
    "  Android avlodlari",
    "  Android qobiqlar",
  ];
  List<Widget Function()> links = [
        () => const AboutPhone(),
        () => const HowPhonesWork(),
        () => const AndroidGenerations(),
        () => const AndroidDistrubtions(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.width/3,
          child: CarouselSlider.builder(
            itemCount: texts.length,
            itemBuilder: (BuildContext context, int index, int realIndex){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>links[index]()));
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // shadow position
                          ),
                        ],

                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(images[index])),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue
                    ),
                    child: FittedBox(fit: BoxFit.contain,child: Text(texts[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),)),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
          )
      ),
    );
  }
}

class AppManagement extends StatefulWidget {
  const AppManagement({super.key});

  @override
  State<AppManagement> createState() => _AppManagementState();
}

class _AppManagementState extends State<AppManagement> {
  List<String> images2=[
    "assets/home/s2c1.jpg",
    "assets/home/s2c2.jpg",
    "assets/home/s2c3.jpg",
    "assets/home/s2c4.jpg",
    "assets/home/s2c5.jpg",
    "assets/home/s2c6.jpg",
  ];
  List<String> texts2=[
    "  Samsung OneUI tizimida \nIlovalarni o'rnatish",
    "  Xiomi MIUI'da \nilovalarni o'rnatish",
    "  EMUI va MagicUI'da \nilovalarni o'rnatish",
    "  OneUI'da \nilovalarni o'chirish",
    "  MIUI'da \nilovalarni o'chirish",
    "  EMUI va MAGIC-UI'da \nilovalarni o'chirish",
  ];

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("   Ilovalar boshqaruvi   ",style: TextStyle(backgroundColor: Colors.black45,color: Colors.white,fontSize: 25),),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.red,
                  elevation: 14,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  context: context,
                  isScrollControlled: true, // Bu oynani ekranga to'liq chiqaradi
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // Bu oynani ekranga to'liq chiqaradi
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.white,
                       ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                               CircleAvatar(
                                 radius: 25,
                                 backgroundColor: Colors.red.shade100,
                                 child: CloseButton(onPressed: (){
                                   Navigator.pop(context);
                                 },
                                 color: Colors.red,
                                 ),
                               )
                              ],
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: images2.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context, int index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.green.withOpacity(1),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3), // shadow position
                                              ),
                                            ],

                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(images2[index])),
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.blue
                                        ),
                                        child: FittedBox(fit: BoxFit.contain,child: Text(texts2[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),)),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )
                      ),
                    );
                  },
                );
              },
            color: Colors.blue.shade200, child: const Row(
            children: [
              Text("Ilovalar boshqaruvi batafsil   ",style: TextStyle(fontSize: 20,color: Colors.black),),
              Icon(Icons.arrow_right_alt)
            ],
          ),),
        ],
      ),
    );
  }
}

class IsTwo extends StatefulWidget {
  const IsTwo({super.key});

  @override
  IsTwoState createState() => IsTwoState();
}

class IsTwoState extends State<IsTwo> {
  List<String> images2=[
    "assets/home/s2c1.jpg",
    "assets/home/s2c2.jpg",
    "assets/home/s2c3.jpg",
    "assets/home/s2c4.jpg",
    "assets/home/s2c5.jpg",
    "assets/home/s2c6.jpg",
  ];
  List<String> texts2=[
    "  Samsung OneUI tizimida Ilovalarni o'rnatish",
    "  Xiomi MIUI'da ilovalarni o'rnatish",
    "  EMUI va MagicUI'da ilovalarni o'rnatish",
    "  OneUI'da ilovalarni o'chirish",
    "  MIUI'da ilovalarni o'chirish",
    "  EMUI va MAGIC-UI'da ilovalarni o'chirish",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.width/3,
          child: CarouselSlider.builder(
            itemCount: texts2.length,
            itemBuilder: (BuildContext context, int index, int realIndex){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // shadow position
                        ),
                      ],

                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(images2[index])),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue
                  ),
                  child: FittedBox(fit: BoxFit.contain,
                    child: Text(
                      textAlign: TextAlign.center,
                      texts2[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              reverse: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
          )
      ),
    );
  }
}

class BatterySave extends StatelessWidget {
  const BatterySave({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.greenAccent.withOpacity(1),
                spreadRadius: 7,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],

            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c1.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.white),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "Batareya samaradorligini oshirish.",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class DataManagement extends StatelessWidget {
  const DataManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c2.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.red),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "Ma’lumotlarni boshqarish va saqlash.",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class Connectivity extends StatefulWidget {
  const Connectivity({super.key});

  @override
  State<Connectivity> createState() => _ConnectivityState();
}

class _ConnectivityState extends State<Connectivity> {
  List<String> images3=[
    "assets/home/s3c1.jpg",
    "assets/home/s3c2.jpg",
    "assets/home/s3c3.jpg",
    "assets/home/s3c4.jpg",
    "assets/home/s3c5.jpg",
  ];
  List<String> texts3=[
    "  WiFi orqali internetga kirish.",
    "  Bluetooth orqali internetga kirish.",
    "  Mobil ma'lumot orqali internetga ulanish.",
    "  Ulanish nuqtasi (Hotspot)ni sozlash.",
    "  USB Kabel orqali Telefondan \nKompyuterga Internet tarqatish",
  ];
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("   Ulanishlar    ",style: TextStyle(backgroundColor: Colors.black45,color: Colors.white,fontSize: 25),),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.red,
                elevation: 14,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                context: context,
                isScrollControlled: true, // Bu oynani ekranga to'liq chiqaradi
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // Bu oynani ekranga to'liq chiqaradi
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.red.shade100,
                                  child: CloseButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: images3.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // shadow position
                                          ),
                                        ],

                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(images3[index])),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue
                                    ),
                                    child: FittedBox(fit: BoxFit.contain,child: Text(texts3[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),)),
                                  ),
                                );
                              }),
                            ),
                          ],
                        )
                    ),
                  );
                },
              );
            },
            color: Colors.blue.shade200, child: const Row(
            children: [
              Text("Ulanishlar haqida batafsil",style: TextStyle(fontSize: 20,color: Colors.black),),
              Icon(Icons.arrow_right_alt)
            ],
          ),),
        ],
      ),
    );
  }
}

class IsThree extends StatefulWidget {
  const IsThree({super.key});

  @override
  IsThreeState createState() => IsThreeState();
}

class IsThreeState extends State<IsThree> {
  List<String> images3=[
    "assets/home/s3c1.jpg",
    "assets/home/s3c2.jpg",
    "assets/home/s3c3.jpg",
    "assets/home/s3c4.jpg",
    "assets/home/s3c5.jpg",
  ];
  List<String> texts3=[
    "  WiFi orqali internetga kirish.",
    "  Bluetooth orqali internetga kirish.",
    "  Mobil ma'lumot orqali internetga ulanish.",
    "  Ulanish nuqtasi (Hotspot)ni sozlash.",
    "  USB Kabel orqali Telefondan Kompyuterga Internet tarqatish",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.width/3,
          child: CarouselSlider.builder(
            itemCount: texts3.length,
            itemBuilder: (BuildContext context, int index, int realIndex){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // shadow position
                        ),
                      ],

                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(images3[index])),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue
                  ),
                  child: FittedBox(fit: BoxFit.contain,
                    child: Text(
                      textAlign: TextAlign.center,
                      texts3[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
          )
      ),
    );
  }
}

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  List<String> images4=[
    "assets/home/s4c1.jpg",
    "assets/home/s4c2.jpg",
    "assets/home/s4c3.jpg",
    "assets/home/s4c4.jpg",
  ];
  List<String> texts4=[
    "  Telefon ekraniga \nGrafik(Chizmali) parol qo'yish.",
    "  Telefon ekraniga Raqamli parol \n(PIN Code)qo'yish.",
    "  Telefon ekraniga parol qo'yish.",
    "  Andoidda maxfiylikni oshirish.",
  ];
  @override
  Widget build(BuildContext context) {
    return FittedBox(fit: BoxFit.fill,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("   Xavfsizlik: Telefonda xavfsizlik choralari   ",style: TextStyle(backgroundColor: Colors.black45,color: Colors.white,fontSize: 25),),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.red,
                elevation: 14,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                context: context,
                isScrollControlled: true, // Bu oynani ekranga to'liq chiqaradi
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // Bu oynani ekranga to'liq chiqaradi
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.red.shade100,
                                  child: CloseButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: images4.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // shadow position
                                          ),
                                        ],

                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(images4[index])),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue
                                    ),
                                    child: FittedBox(fit: BoxFit.contain,child: Text(texts4[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),)),
                                  ),
                                );
                              }),
                            ),
                          ],
                        )
                    ),
                  );
                },
              );
            },
            color: Colors.blue.shade200, child: const Row(
            children: [
              Text("Xavfsizlik haqida batafsil",style: TextStyle(fontSize: 20,color: Colors.black),),
              Icon(Icons.arrow_right_alt)
            ],
          ),),
        ],
      ),
    );
  }
}


class IsFour extends StatefulWidget {
  const IsFour({super.key});

  @override
  IsFourState createState() => IsFourState();
}

class IsFourState extends State<IsFour> {
  List<String> images4=[
    "assets/home/s4c1.jpg",
    "assets/home/s4c2.jpg",
    "assets/home/s4c3.jpg",
    "assets/home/s4c4.jpg",
  ];
  List<String> texts4=[
    "  Telefon ekraniga Grafik(Chizmali) parol qo'yish.",
    "  Telefon ekraniga Raqamli parol (PIN Code)qo'yish.",
    "  Telefon ekraniga parol qo'yish.",
    "  Andoidda maxfiylikni oshirish.",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.width/3,
          child: CarouselSlider.builder(
            itemCount: texts4.length,
            itemBuilder: (BuildContext context, int index, int realIndex){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // shadow position
                        ),
                      ],

                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(images4[index])),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue
                  ),
                  child: FittedBox(fit: BoxFit.contain,
                    child: Text(
                      textAlign: TextAlign.center,
                      texts4[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              reverse: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
          )
      ),
    );
  }
}

class GoogleServices extends StatelessWidget {
  const GoogleServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c3.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.red),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "Google Play xizmatlari.",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class Multimedia extends StatelessWidget {
  const Multimedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c4.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.red),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "Multimedia: Foto, video, va musiqa ilovalarini ishlatish.",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class Preformance extends StatelessWidget {
  const Preformance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c5.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.red),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "Ish samaradorligini oshirish",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class SocialNetwork extends StatefulWidget {
  const SocialNetwork({super.key});

  @override
  State<SocialNetwork> createState() => _SocialNetworkState();
}

class _SocialNetworkState extends State<SocialNetwork> {
  List<String> images4=[
    "assets/home/s5c1.jpg",
    "assets/home/s5c2.jpg",
    "assets/home/s5c3.jpg",
    "assets/home/s5c4.jpg",
    "assets/home/s5c5.jpg",
  ];
  List<String> texts4=[
    "  Instagram hisob yaratish.",
    "  Telegram hisobini yaratish.",
    "  Telegram hisobni \no'chirish(yo'q qilish)",
    "  WhatsApp hisob yaratish.",
    "  Snapchat hisob yaratish",
  ];
  @override
  Widget build(BuildContext context) {
    return FittedBox(fit: BoxFit.fill,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("   Ijtimoiy tarmoq ilovalari   ",style: TextStyle(backgroundColor: Colors.black45,color: Colors.white,fontSize: 25),),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.red,
                elevation: 14,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                context: context,
                isScrollControlled: true, // Bu oynani ekranga to'liq chiqaradi
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // Bu oynani ekranga to'liq chiqaradi
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.red.shade100,
                                  child: CloseButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: images4.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // shadow position
                                          ),
                                        ],

                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(images4[index])),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue
                                    ),
                                    child: FittedBox(fit: BoxFit.contain,child: Text(texts4[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),)),
                                  ),
                                );
                              }),
                            ),
                          ],
                        )
                    ),
                  );
                },
              );
            },
            color: Colors.blue.shade200, child: const Row(
            children: [
              Text("Ijtimoiy tarmoq haqida batafsil",style: TextStyle(fontSize: 20,color: Colors.black),),
              Icon(Icons.arrow_right_alt)
            ],
          ),),
        ],
      ),
    );
  }
}


class IsFive extends StatefulWidget {
  const IsFive({super.key});

  @override
  IsFiveState createState() => IsFiveState();
}

class IsFiveState extends State<IsFive> {
  List<String> images4=[
    "assets/home/s5c1.jpg",
    "assets/home/s5c2.jpg",
    "assets/home/s5c3.jpg",
    "assets/home/s5c4.jpg",
    "assets/home/s5c5.jpg",
  ];
  List<String> texts4=[
    "  Instagram hisob yaratish.",
    "  Telegram hisobini yaratish.",
    "  Telegram hisobni o'chirish(yo'q qilish)",
    "  WhatsApp hisob yaratish.",
    "  Snapchat hisob yaratish",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.width/3,
          child: CarouselSlider.builder(
            itemCount: texts4.length,
            itemBuilder: (BuildContext context, int index, int realIndex){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // shadow position
                        ),
                      ],

                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(images4[index])),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue
                  ),
                  child: FittedBox(fit: BoxFit.contain,
                    child: Text(
                      textAlign: TextAlign.center,
                      texts4[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
          )
      ),
    );
  }
}

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c6.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.red),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "ENG SARA O'YINLAR",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class Healty extends StatelessWidget {
  const Healty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c7.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.red),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "Salomatlik ilovalari",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  List<String> images4=[
    "assets/home/s6c1.jpg",
    "assets/home/s6c2.jpg",
  ];
  List<String> texts4=[
    "  Google Xaritalarni ishlatish",
    "  Yandex Xaritalarni ishlatish.",
  ];
  @override
  Widget build(BuildContext context) {
    return FittedBox(fit: BoxFit.fill,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("   Xaritalar   ",style: TextStyle(backgroundColor: Colors.black45,color: Colors.white,fontSize: 25),),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.red,
                elevation: 14,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                context: context,
                isScrollControlled: true, // Bu oynani ekranga to'liq chiqaradi
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // Bu oynani ekranga to'liq chiqaradi
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.red.shade100,
                                  child: CloseButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: images4.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // shadow position
                                          ),
                                        ],

                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(images4[index])),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue
                                    ),
                                    child: FittedBox(fit: BoxFit.contain,child: Text(texts4[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),)),
                                  ),
                                );
                              }),
                            ),
                          ],
                        )
                    ),
                  );
                },
              );
            },
            color: Colors.blue.shade200, child: const Row(
            children: [
              Text("Xaritalar haqida batafsil",style: TextStyle(fontSize: 20,color: Colors.black),),
              Icon(Icons.arrow_right_alt)
            ],
          ),),
        ],
      ),
    );
  }
}


class IsSix extends StatefulWidget {
  const IsSix({super.key});

  @override
  IsSixState createState() => IsSixState();
}

class IsSixState extends State<IsSix> {
  List<String> images4=[
    "assets/home/s6c1.jpg",
    "assets/home/s6c2.jpg",
  ];
  List<String> texts4=[
    "  Google Xaritalarni ishlatish",
    "  Yandex Xaritalarni ishlatish.",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.width/3,
          child: CarouselSlider.builder(
            itemCount: texts4.length,
            itemBuilder: (BuildContext context, int index, int realIndex){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // shadow position
                        ),
                      ],

                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(images4[index]),scale: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: FittedBox(fit: BoxFit.contain,
                    child: Text(
                      textAlign: TextAlign.center,
                      texts4[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              reverse: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
          )
      ),
    );
  }
}

class CloudServices extends StatelessWidget {
  const CloudServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c8.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.red),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "Bulutli xizmatlar",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class Customize extends StatelessWidget {
  const Customize({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // shadow position
              ),
            ],
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/home/c9.jpg")),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 6,color: Colors.red),
            color: Colors.blue
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            textAlign: TextAlign.center,
            "Telefonni moslashtirish",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
        ),
      ),
    );
  }
}

class FixProblem extends StatefulWidget {
  const FixProblem({super.key});

  @override
  State<FixProblem> createState() => _FixProblemState();
}

class _FixProblemState extends State<FixProblem> {
  List<String> images4=[
    "assets/home/s7c1.jpg",
    "assets/home/s7c2.jpg",
    "assets/home/s7c3.jpg",
    "assets/home/s7c4.jpg",
    "assets/home/s7c5.jpg",
  ];
  List<String> texts4=[
    "  Xotira to'lib qolsa qanday tozalash kerak?",
    "  Telefon sekin yoki qotib ishlasa nima qilish kerak?",
    "  Internet ishlamay qolsa nima qilish kerak?",
    "  Internet sekin ishlasa nima qilish kerak?",
    "  Telefonda hujjatlarni ochmasa nima qilish kerak?",
  ];
  @override
  Widget build(BuildContext context) {
    return FittedBox(fit: BoxFit.fill,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("   Muammoni tuzatish   ",style: TextStyle(backgroundColor: Colors.black45,color: Colors.white,fontSize: 25),),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.red,
                elevation: 14,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                context: context,
                isScrollControlled: true, // Bu oynani ekranga to'liq chiqaradi
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // Bu oynani ekranga to'liq chiqaradi
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.red.shade100,
                                  child: CloseButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: images4.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // shadow position
                                          ),
                                        ],

                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(images4[index])),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue
                                    ),
                                    child: FittedBox(fit: BoxFit.contain,child: Text(texts4[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),)),
                                  ),
                                );
                              }),
                            ),
                          ],
                        )
                    ),
                  );
                },
              );
            },
            color: Colors.blue.shade200, child: const Row(
            children: [
              Text("Muammoni tuzatish haqida batafsil",style: TextStyle(fontSize: 20,color: Colors.black),),
              Icon(Icons.arrow_right_alt)
            ],
          ),),
        ],
      ),
    );
  }
}


class IsSn extends StatefulWidget {
  const IsSn({super.key});

  @override
  IsSnState createState() => IsSnState();
}

class IsSnState extends State<IsSn> {
  List<String> images4=[
    "assets/home/s7c1.jpg",
    "assets/home/s7c2.jpg",
    "assets/home/s7c3.jpg",
    "assets/home/s7c4.jpg",
    "assets/home/s7c5.jpg",
  ];
  List<String> texts4=[
    "  Xotira to'lib qolsa qanday tozalash kerak?",
    "  Telefon sekin yoki qotib ishlasa nima qilish kerak?",
    "  Internet ishlamay qolsa nima qilish kerak?",
    "  Internet sekin ishlasa nima qilish kerak?",
    "  Telefonda hujjatlarni ochmasa nima qilish kerak?",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.width/3,
          child: CarouselSlider.builder(
            itemCount: texts4.length,
            itemBuilder: (BuildContext context, int index, int realIndex){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // shadow position
                        ),
                      ],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(images4[index]),scale: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: FittedBox(fit: BoxFit.contain,
                    child: Text(
                      textAlign: TextAlign.center,
                      texts4[index],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.brown),),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
          )
      ),
    );
  }
}