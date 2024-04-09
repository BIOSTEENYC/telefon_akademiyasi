import 'package:flutter/material.dart';
import 'package:universal_image/universal_image.dart';

class DeletteAppsOneUI extends StatefulWidget {
  const DeletteAppsOneUI({super.key});

  @override
  State<DeletteAppsOneUI> createState() => _DeletteAppsOneUIState();
}

class _DeletteAppsOneUIState extends State<DeletteAppsOneUI> {
  final String image = "assets/images/DeletteApps.webp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        title: const Text("OneUIda ilovalar o'chirish"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: UniversalImage(image, fit: BoxFit.contain,
        ),
      ),
    );
  }
}

