import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/utils/app_colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:telefon_akademiyasi/main.dart'; 

class DialogManager {
  static bool _isLoadingDialogShowing = false;

  static void showLoadingDialog(BuildContext context) {
    if (_isLoadingDialogShowing) return;

    _isLoadingDialogShowing = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
          ),
        );
      },
    ).then((_) {
      _isLoadingDialogShowing = false;
    });
  }

  static void hideLoadingDialog(BuildContext context) {
    if (!_isLoadingDialogShowing) return;

    if (navigatorKey.currentContext != null && navigatorKey.currentContext!.mounted && Navigator.of(navigatorKey.currentContext!).canPop()) {
      Navigator.of(navigatorKey.currentContext!).pop();
      _isLoadingDialogShowing = false;
    } else {
      _isLoadingDialogShowing = false;
      debugPrint("Warning: Tried to hide loading dialog but navigator context was unavailable or cannot pop.");
    }
  }

  static void showAlertDialog({
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
    bool isNetworkError = false,
  }) {
    if (navigatorKey.currentContext == null || !navigatorKey.currentContext!.mounted) {
      debugPrint("AlertDialog: Navigator context is null or not mounted. Cannot show dialog.");
      return;
    }

    showDialog(
      context: navigatorKey.currentContext!, 
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: Column(
            children: [
              Icon(
                isNetworkError ? Icons.wifi_off : Icons.warning_amber_rounded,
                color: AppColors.errorColor,
                size: 48,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textColor),
              ),
              if (isNetworkError)
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Wi-Fidamisiz? yoki Mobil Internetda? ulanishni tekshirib qayta yuklashni bosing",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 13),
                  ),
                ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {

                  Navigator.of(context).pop();

                  if (onPressed != null) {
                    onPressed();
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  buttonText ?? 'OK',
                  style: const TextStyle(color: AppColors.textColor, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<bool> checkInternetAndShowDialog({
    required VoidCallback onRetry,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      showAlertDialog(
        title: 'Internetga ulanish yo\'q',
        message: 'Ilova ishlashi uchun internetga ulanish zarur.',
        isNetworkError: true,
        onPressed: onRetry,
        buttonText: 'Qayta yuklash',
      );
      return false;
    }
    return true;
  }
}