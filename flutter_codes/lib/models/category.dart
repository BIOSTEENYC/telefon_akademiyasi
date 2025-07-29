// lib/models/category.dart
import 'package:telefon_akademiyasi/models/guide.dart';

class Category {
  final String categoryName;
  final String iconEmoji;
  final List<Guide> guides;

  Category({
    required this.categoryName,
    required this.iconEmoji,
    required this.guides,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var guidesList = json['guides'] as List;
    List<Guide> guides = guidesList.map((i) => Guide.fromJson(i)).toList();

    return Category(
      categoryName: json['category_name'],
      iconEmoji: json['icon_emoji'],
      guides: guides,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'icon_emoji': iconEmoji,
      'guides': guides.map((g) => g.toJson()).toList(),
    };
  }
}