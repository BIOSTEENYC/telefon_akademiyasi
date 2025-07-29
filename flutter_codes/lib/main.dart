import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/screens/splash_screen.dart';
import 'package:telefon_akademiyasi/screens/categories_screen.dart';
import 'package:telefon_akademiyasi/screens/favorites_screen.dart';
import 'package:telefon_akademiyasi/screens/guide_viewer_screen.dart';
import 'package:telefon_akademiyasi/screens/about_us_screen.dart'; 
import 'package:telefon_akademiyasi/screens/game_screen.dart';     
import 'package:telefon_akademiyasi/utils/app_colors.dart';
import 'package:telefon_akademiyasi/models/guide.dart';
import 'package:telefon_akademiyasi/widgets/bottom_nav_bar.dart'; 

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telefon Akademiyasi', 
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
        primarySwatch: AppColors.primaryBlueSwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.bgColor,
        appBarTheme: const AppBarTheme( 
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.lightTextColor, 
          elevation: 0,
        ),

      ),
      navigatorKey: navigatorKey,
      home: const SplashScreen(), 
      onGenerateRoute: (settings) {
        if (settings.name == '/guide_viewer') {
          final args = settings.arguments;
          if (args is Guide) {
            return MaterialPageRoute(
              builder: (context) => GuideViewerScreen(guide: args),
            );
          }
        }
        return null;
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const CategoriesScreen(),  
    const FavoritesScreen(),   
    SnakeGameScreen(),        
    const AboutUsScreen(),     
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Telefon Akademiyasi',
          style: TextStyle(color: AppColors.lightTextColor),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}