import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/src/news/models/news.dart';

class NewsRepository {
  Future<News> getNews() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&apiKey=46bb8d4dec514a28a1f64fdc9e4a8866',
        ),
      );

      final data = json.decode(response.body) as Map;
      final news = News.fromJson(data as Map<String, dynamic>);
      return news;
    } catch (e) {
      rethrow;
    }
  }
}
