
import 'package:http/http.dart' as http;
import 'package:lap/bai7/artical.dart';

class NewsApiService {
  // 🔑 Thay dòng dưới bằng API key bạn lấy ở https://newsapi.org/
  static const String _apiKey = '158fcd4e7c194347b58ce3bd3f322258';

  /// Lấy danh sách tin tức nổi bật (Top Headlines)
  static Future<List<Article>> fetchTopHeadlines({
    String country = 'vn', // có thể đổi thành 'vn' để lấy tin Việt Nam
    int pageSize = 30,
  }) async {
    final uri = Uri.https('newsapi.org', '/v2/top-headlines', {
      'country': country,
      'pageSize': '$pageSize',
    });

    final res = await http.get(
      uri,
      headers: {'X-Api-Key': _apiKey},
    );

    if (res.statusCode == 200) {
      return Article.listFromResponse(res.body);
    } else {
      throw Exception(
          'NewsAPI lỗi ${res.statusCode}: ${res.reasonPhrase ?? ''}');
    }
  }
}
