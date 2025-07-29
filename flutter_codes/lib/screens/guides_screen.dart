import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telefon_akademiyasi/models/category.dart';
import 'package:telefon_akademiyasi/models/guide.dart';
import 'package:telefon_akademiyasi/screens/guide_viewer_screen.dart';
import 'package:telefon_akademiyasi/utils/app_colors.dart';
import 'package:telefon_akademiyasi/widgets/custom_search_bar.dart';

class GuidesScreen extends StatefulWidget {
  final Category category;
  const GuidesScreen({super.key, required this.category});

  @override
  State<GuidesScreen> createState() => _GuidesScreenState();
}

class _GuidesScreenState extends State<GuidesScreen> {
  List<Guide> _guides = [];
  List<Guide> _filteredGuides = [];
  final TextEditingController _searchController = TextEditingController();
  Set<String> _favoriteGuideUrls = {};

  @override
  void initState() {
    super.initState();
    _guides = widget.category.guides;
    _filteredGuides = _guides;
    _searchController.addListener(_filterGuides);
    _loadFavoriteUrls();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterGuides);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadFavoriteUrls() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteGuideUrls = (prefs.getStringList('favoriteGuideUrls') ?? []).toSet();
    });
  }

  Future<void> _toggleFavorite(Guide guide) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteUrls = prefs.getStringList('favoriteGuideUrls') ?? [];

    if (_favoriteGuideUrls.contains(guide.documentUrl)) {
      favoriteUrls.remove(guide.documentUrl);
      setState(() {
        _favoriteGuideUrls.remove(guide.documentUrl);
      });
    } else {
      favoriteUrls.add(guide.documentUrl);
      setState(() {
        _favoriteGuideUrls.add(guide.documentUrl);
      });
    }
    await prefs.setStringList('favoriteGuideUrls', favoriteUrls);
  }

  void _filterGuides() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredGuides = _guides.where((guide) {
        return guide.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor, 
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue, 
        title: Text(widget.category.categoryName, style: const TextStyle(color: AppColors.lightTextColor)), 
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.lightTextColor), 
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),

            child: Container(
              decoration: BoxDecoration(
                color: AppColors.searchBarBg, 
                borderRadius: BorderRadius.circular(30.0), 
                border: Border.all(color: AppColors.primaryBlue, width: 2.0), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CustomSearchBar(
                controller: _searchController,
                hintText: 'Qidiruv qo\'llanmalar bo\'yicha...',
                onChanged: (value) => _filterGuides(),
              ),
            ),
          ),
          Expanded(
            child: _filteredGuides.isEmpty
                ? const Center(
                    child: Text(
                      'Hech qanday qo\'llanma topilmadi.',
                      style: TextStyle(color: AppColors.lightTextColor, fontSize: 16), 
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _filteredGuides.length,
                    itemBuilder: (context, index) {
                      final guide = _filteredGuides[index];
                      final isFavorite = _favoriteGuideUrls.contains(guide.documentUrl);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, 
                          children: [

                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.searchBarBg, 
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.borderColor, width: 2.0), 
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  guide.iconEmoji,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(25.0),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GuideViewerScreen(guide: guide),
                                      ),
                                    ).then((value) => _loadFavoriteUrls());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.searchBarBg, 
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(color: AppColors.borderColor, width: 2.0), 
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.1), 
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            guide.title,
                                            style: const TextStyle(color: AppColors.darkTextColor, fontSize: 18), 
                                            maxLines: null, 
                                            overflow: TextOverflow.visible, 
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            isFavorite ? Icons.favorite : Icons.favorite_border,
                                            color: isFavorite ? AppColors.bottomNavItemActiveBg : AppColors.darkTextColor, 
                                          ),
                                          onPressed: () => _toggleFavorite(guide),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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