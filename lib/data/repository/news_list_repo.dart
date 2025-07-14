import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/data/models/news_model.dart';

class NewsListRepo {
  Future<NewsPojo> fetchNews() async {
    final response = await http.get(
      Uri.parse(
        'https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=us&max=10&apikey=5741bb5a416d5785735ae8e18df550dd',
      ),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return NewsPojo.fromJson(jsonData);
    } else {
      throw Exception(
          'Failed to fetch news. Status code: ${response.statusCode}');
    }
  }
}
