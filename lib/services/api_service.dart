// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_uts/models/product.dart';

class ApiService {
  // Base URL TheMealDB
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  // 1. Mengambil data berdasarkan kategori (Contoh: Dessert untuk Roti/Kue)
  Future<List<Product>> getProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$_baseUrl/filter.php?c=$category'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['meals'] == null) return [];

      return (data['meals'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
    } else {
      throw Exception('Gagal memuat data kategori');
    }
  }

  // 2. Fitur Pencarian (Search)
  Future<List<Product>> searchProducts(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/search.php?s=$query'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['meals'] == null) return [];

      return (data['meals'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
    } else {
      throw Exception('Gagal mencari produk');
    }
  }

  // 3. Mengambil Detail Produk (karena endpoint filter tidak menyediakan deskripsi lengkap)
  Future<Product> getProductDetail(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/lookup.php?i=$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['meals'] == null) throw Exception("Data kosong");

      return Product.fromJson(data['meals'][0]);
    } else {
      throw Exception('Gagal memuat detail produk');
    }
  }
}