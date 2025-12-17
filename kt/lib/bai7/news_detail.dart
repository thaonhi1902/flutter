import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lap/bai7/artical.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;
  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), // 🌫️ nền xám nhạt như trang danh sách
      appBar: AppBar(
        title: const Text('Chi tiết bài viết'),
        centerTitle: true,
        backgroundColor: const Color(0xFFE8EAF6),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 16 : screenWidth * 0.15,
          vertical: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, // 🟦 khung trắng giống các card tin
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🖼️ Ảnh minh họa to, bo góc
              if (article.urlToImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 320, // 🔹 cao vừa đủ, cân đối trên web
                    placeholder: (context, url) => Container(
                      height: 320,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 320,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.broken_image, size: 60),
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              // 📰 Tiêu đề bài viết
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 12),

              // 🔹 Mô tả ngắn
              if ((article.description ?? '').isNotEmpty)
                Text(
                  article.description!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.6,
                  ),
                ),

              const SizedBox(height: 16),

              // 🔸 Nội dung chi tiết
              if ((article.content ?? '').isNotEmpty)
                Text(
                  article.content!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.7,
                  ),
                ),

              const SizedBox(height: 24),

              // 🔗 Nút mở bài gốc
              if (article.url != null)
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(article.url!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Không mở được liên kết')),
                        );
                      }
                    },
                    icon: const Icon(Icons.open_in_browser),
                    label: const Text('Mở bài gốc'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}