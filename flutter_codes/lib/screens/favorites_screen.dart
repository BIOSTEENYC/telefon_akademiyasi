import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telefon_akademiyasi/api/data_service.dart';
import 'package:telefon_akademiyasi/models/category.dart';
import 'package:telefon_akademiyasi/models/guide.dart';
import 'package:telefon_akademiyasi/screens/guide_viewer_screen.dart';
import 'package:telefon_akademiyasi/utils/app_colors.dart';
import 'package:telefon_akademiyasi/utils/dialog_manager.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Guide> _favoriteGuides = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteUrls = prefs.getStringList('favoriteGuideUrls') ?? [];

    if (favoriteUrls.isEmpty) {
      if (mounted) {
        setState(() {
          _favoriteGuides = [];
          _isLoading = false;
        });
      }
      return;
    }

    bool hasInternet = await DialogManager.checkInternetAndShowDialog(onRetry: _loadFavorites);
    if (!hasInternet) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Internetga ulanish yo\'q.';
        });
      }
      return;
    }

    try {
      final dataService = DataService();
      List<Category> allCategories = await dataService.fetchAllCategoriesAndGuides();
      Map<String, Guide> allGuidesMap = {};
      for (var category in allCategories) {
        for (var guide in category.guides) {
          allGuidesMap[guide.documentUrl] = guide;
        }
      }

      List<Guide> tempFavorites = [];
      for (String url in favoriteUrls) {
        if (allGuidesMap.containsKey(url)) {
          tempFavorites.add(allGuidesMap[url]!);
        }
      }

      if (mounted) {
        setState(() {
          _favoriteGuides = tempFavorites;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Sevimlilarni yuklashda xato yuz berdi: ${e.toString()}';
          _isLoading = false;
        });
        DialogManager.showAlertDialog(
          title: 'Xato!',
          message: _errorMessage,
          buttonText: 'OK',
          onPressed: () {

          },
        );
      }
    }
  }

  Future<void> _removeFavorite(String documentUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteUrls = prefs.getStringList('favoriteGuideUrls') ?? [];
    favoriteUrls.remove(documentUrl);
    await prefs.setStringList('favoriteGuideUrls', favoriteUrls);
    _loadFavorites(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sevimlilar',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                    ),
                  )
                : _errorMessage.isNotEmpty
                    ? Center(
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: AppColors.errorColor, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : _favoriteGuides.isEmpty
                        ? const Center(
                            child: Text(
                              'Sevimlilarda qo\'llanmalar mavjud emas.',
                              style: TextStyle(color: AppColors.textColor, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: _favoriteGuides.length,
                            itemBuilder: (context, index) {
                              final guide = _favoriteGuides[index];
                              return Card(
                                color: AppColors.searchBarBg,
                                margin: const EdgeInsets.symmetric(vertical: 8.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                elevation: 3,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                  leading: Text(guide.iconEmoji, style: const TextStyle(fontSize: 32)),
                                  title: Text(
                                    guide.title,
                                    style: const TextStyle(color: AppColors.darkTextColor, fontSize: 18),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.favorite, color: AppColors.bottomNavItemActive),
                                    onPressed: () => _removeFavorite(guide.documentUrl),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GuideViewerScreen(guide: guide),
                                      ),
                                    ).then((value) => _loadFavorites()); 
                                  },
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}