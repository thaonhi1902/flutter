import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lap/bai7/artical.dart';
import 'package:lap/bai7/news_api.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});
  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late Future<List<Article>> _future;

  @override
  void initState() {
    super.initState();
    // 🔹 Lấy danh sách tin tức từ Mỹ
    _future = NewsApiService.fetchTopHeadlines(country: 'us', pageSize: 30) as Future<List<Article>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Tin tức'),
        centerTitle: true,
      ),

      // 🔹 Dùng FutureBuilder để lấy và hiển thị dữ liệu
      body: FutureBuilder<List<Article>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }

          final articles = snapshot.data ?? [];
          if (articles.isEmpty) {
            return const Center(child: Text('Không có bài viết'));
          }

          // ✅ Danh sách bài viết
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: articles.length,
            itemBuilder: (context, i) => _buildArticleCard(context, articles[i]),
          );
        },
      ),
    );
  }

  // 🧩 Widget hiển thị từng bài viết trong khung chữ nhật
  Widget _buildArticleCard(BuildContext context, Article a) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/detail', arguments: a),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white, // 🔲 Nền trắng
          borderRadius: BorderRadius.circular(10), // 🔹 Bo góc
          border: Border.all(
            color: Colors.grey.shade300, // 🔹 Viền mảnh nhẹ
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Ảnh bên trái
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: a.urlToImage != null
                  ? CachedNetworkImage(
                      imageUrl: a.urlToImage!,
                      width: 110,
                      height: 90,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) =>
                          const Icon(Icons.broken_image, size: 40),
                    )
                  : Container(
                      width: 110,
                      height: 90,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image_not_supported, size: 40),
                    ),
            ),

            const SizedBox(width: 10),

            // 📰 Tiêu đề, mô tả và nguồn
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    a.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    a.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    a.sourceName ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blueAccent,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}