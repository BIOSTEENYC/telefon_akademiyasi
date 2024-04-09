import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/pages/delette_apps_oneui.dart';
import 'package:telefon_akademiyasi/pages/home_page.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MaterialApp(
    home: DeletteAppsOneUI(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/intro.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
