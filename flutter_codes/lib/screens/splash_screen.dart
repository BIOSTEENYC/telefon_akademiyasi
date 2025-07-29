import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/api/data_service.dart';
import 'package:telefon_akademiyasi/main.dart'; 
import 'package:telefon_akademiyasi/utils/app_colors.dart';
import 'package:telefon_akademiyasi/utils/dialog_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });
  }

  Future<void> _initializeData() async {
    bool hasInternet = await DialogManager.checkInternetAndShowDialog(onRetry: _initializeData);
    if (!hasInternet) {
      return;
    }

    DialogManager.showLoadingDialog(navigatorKey.currentContext!);

    try {

      await DataService().fetchAllCategoriesAndGuides();

      if (navigatorKey.currentContext != null && navigatorKey.currentContext!.mounted) {
        DialogManager.hideLoadingDialog(navigatorKey.currentContext!);
      }

      if (navigatorKey.currentContext != null && navigatorKey.currentContext!.mounted) {
        Navigator.of(navigatorKey.currentContext!).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    } catch (e) {
      if (navigatorKey.currentContext != null && navigatorKey.currentContext!.mounted) {
        DialogManager.hideLoadingDialog(navigatorKey.currentContext!);
      }

      DialogManager.showAlertDialog(
        title: 'Xato!',
        message: 'Ma\'lumotlarni yuklashda xato yuz berdi: ${e.toString()}',
        buttonText: 'Qayta urinish',
        onPressed: () {
          _initializeData();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/app_icon.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'Ma\'lumotlar yuklanmoqda...',
              style: TextStyle(color: AppColors.textColor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}