import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/api/data_service.dart';
import 'package:telefon_akademiyasi/models/category.dart';
import 'package:telefon_akademiyasi/screens/guides_screen.dart';
import 'package:telefon_akademiyasi/utils/app_colors.dart';
import 'package:telefon_akademiyasi/utils/dialog_manager.dart';
import 'package:telefon_akademiyasi/widgets/custom_search_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categories = [];
  List<Category> _filteredCategories = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchCategories();
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCategories);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchCategories() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    bool hasInternet = await DialogManager.checkInternetAndShowDialog(onRetry: _fetchCategories);
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
      List<Category> fetchedCategories = await DataService().fetchAllCategoriesAndGuides();
      if (mounted) {
        setState(() {
          _categories = fetchedCategories;
          _filteredCategories = fetchedCategories;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Ma\'lumotlarni yuklashda xato: ${e.toString()}';
          _isLoading = false;
        });
        DialogManager.showAlertDialog(
          title: 'Xato!',
          message: _errorMessage,
          buttonText: 'Qayta urinish',
          onPressed: () {
            _fetchCategories();
          },
        );
      }
    }
  }

  void _filterCategories() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCategories = _categories.where((category) {
        return category.categoryName.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor, 
      body: Column(
        children: [
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
                    : _filteredCategories.isEmpty
                        ? const Center(
                            child: Text(
                              'Hech qanday kategoriya topilmadi.',
                              style: TextStyle(color: AppColors.lightTextColor, fontSize: 16), 
                              textAlign: TextAlign.center,
                            ),
                          )
                        : LayoutBuilder(
                            builder: (context, constraints) {
                              int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2; 
                              return GridView.builder(
                                padding: const EdgeInsets.all(16.0),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: 1.0, 
                                ),
                                itemCount: _filteredCategories.length,
                                itemBuilder: (context, index) {
                                  final category = _filteredCategories[index];
                                  return _buildCategoryCard(category);
                                },
                              );
                            },
                          ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0), 
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.searchBarBg, 
                borderRadius: BorderRadius.circular(30.0), 
                border: Border.all(color: AppColors.searchBarBorderColor, width: 2.0), 
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
                hintText: 'Qidiruv kategoriyalar bo\'yicha...',
                onChanged: (value) => _filterCategories(),
              ),
            ),
          ),
          SizedBox(height: 8.0), 
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Category category) {
    return Container( 
      decoration: BoxDecoration(
        color: AppColors.textColor, 
        borderRadius: BorderRadius.circular(15.0), 
        border: Border.all(color: AppColors.borderColor, width: 2.0), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material( 
        color: Colors.transparent, 
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GuidesScreen(category: category),
              ),
            );
          },
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  category.iconEmoji,
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    category.categoryName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.darkTextColor, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}