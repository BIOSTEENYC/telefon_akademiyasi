import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart'; 

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  Future<void> _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Telefon Akademiyasi Ilovasi Bo\'yicha Savol',
        'body': 'Assalomu alaykum,\n\n',
      },
    );
    if (!await launchUrl(emailLaunchUri)) {
      debugPrint('Could not launch $emailLaunchUri');

      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Elektron pochta ilovasi topilmadi!')),
      );
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri urlLaunchUri = Uri.parse(url);
    if (!await launchUrl(urlLaunchUri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlLaunchUri');

      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Veb-saytni ochib bo\'lmadi!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [

            CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.searchBarBg, 
              child: ClipOval(
                child: Image.asset(
                  'assets/app_icon.png', 
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.phone_android, 
                      size: 80,
                      color: AppColors.primaryBlue,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Telefon Akademiyasi',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Versiya: 2.0.0',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.lightTextColor, 
              ),
            ),
            const SizedBox(height: 30),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: AppColors.searchBarBg, 
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ilova haqida',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue, 
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bu ilova foydalanuvchilarga telefonlar bilan bog\'liq umumiy muammolarni hal qilishda yordam berish, texnik bilimlarni oshirish va kundalik foydalanishda uchraydigan savollarga javob topish uchun mo\'ljallangan. Bizning maqsadimiz – har bir foydalanuvchiga ishonchli va amaliy yechimlarni taqdim etish.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: AppColors.darkTextColor,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: AppColors.searchBarBg,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Muallif',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const Divider(color: AppColors.borderColor, thickness: 1, height: 20),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.primaryBlue,
                          child: Icon(Icons.code, color: AppColors.lightTextColor, size: 30),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Abdulhakim the Biosteenyc',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkTextColor,
                              ),
                            ),
                            Text(
                              'Mobil dasturchi', 
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: AppColors.searchBarBg,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aloqa uchun',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const Divider(color: AppColors.borderColor, thickness: 1, height: 20),
                    _buildContactItem(
                      icon: Icons.email,
                      text: 'Email',
                      onTap: () => _launchEmail('xayitboyevabdulhakim@gmail.com'),
                    ),
                    const SizedBox(height: 10),
                    _buildContactItem(
                      icon: Icons.public,
                      text: 'Portfoliya',
                      onTap: () => _launchURL('https://biosteenyc.github.io/'),
                    ),

                    const SizedBox(height: 10),
                    _buildContactItem(
                      icon: Icons.telegram, 
                      text: '@biosteenyc', 
                      onTap: () => _launchURL('https://t.me/biosteenyc'), 
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            Center(
              child: Text(
                '© ${DateTime.now().year} Telefon Akademiyasi. Barcha huquqlar himoyalangan.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.lightTextColor, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryBlue, size: 24),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.darkTextColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();