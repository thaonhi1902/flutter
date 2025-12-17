import 'package:flutter/material.dart';
import 'package:lap/bai7/artical.dart';
import 'package:lap/bai7/news_detail.dart';
import 'package:lap/bai7/news_list.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tin tức',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF2563EB),
      ),
      initialRoute: '/list', // route khởi đầu
      routes: {
        '/list': (context) => const NewsListScreen(),
        '/detail': (context) {
          // 🔹 Lấy đối tượng Article truyền qua arguments
          final article = ModalRoute.of(context)!.settings.arguments as Article;
          return NewsDetailScreen(article: article);
        },
      },
    );
  }
}