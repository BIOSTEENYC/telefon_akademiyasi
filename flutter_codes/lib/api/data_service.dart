import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:telefon_akademiyasi/models/category.dart';
import 'package:telefon_akademiyasi/utils/obfuscation_util.dart';

class DataService {
  final String _dataJsonUrl = "https://raw.githubusercontent.com/BIOSTEENYC/ustamakon/main/documents/phone_topics/data.json";

  Future<List<Category>> fetchAllCategoriesAndGuides() async {
    try {
      final response = await http.get(Uri.parse(_dataJsonUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(utf8.decode(response.bodyBytes));
        return jsonList.map((json) => Category.fromJson(json)).toList();
      } else {
        throw Exception('Kategoriyalarni yuklashda xato yuz berdi. Status kodi: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ma\'lumotlarni yuklashda kutilmagan xato yuz berdi: $e');
    }
  }

  Future<Uint8List> fetchAndDeobfuscateDocument(String documentUrl) async {
    try {
      final response = await http.get(Uri.parse(documentUrl));

      if (response.statusCode == 200) {
        return ObfuscationUtil.deobfuscate(response.bodyBytes);
      } else {
        throw Exception('Hujjatni yuklashda xato yuz berdi. Status kodi: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Hujjatni yuklashda kutilmagan xato yuz berdi: $e');
    }
  }
}