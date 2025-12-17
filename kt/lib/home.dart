import 'package:flutter/material.dart';
import 'package:lap/bai1/classroom.dart';
import 'package:lap/bai2/welcome.dart';
import 'package:lap/bai3/place.dart';
import 'package:lap/bai4/change_color.dart';
import 'package:lap/bai4/count.dart';
import 'package:lap/bai4/countdown.dart';
import 'package:lap/bai5/form_dk.dart';
import 'package:lap/bai5/form_dn.dart';
import 'package:lap/bai6/dssp.dart';
import 'package:lap/bai7/news.dart';
import 'package:lap/bai8/login.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  final String githubUrl = 'https://github.com/thaonhi1902/flutter.git';

  Future<void> _openGitHub() async {
    final uri = Uri.parse(githubUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Không mở được $githubUrl');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Danh sách bài tập',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.blueAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'MENU',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Chọn bài tập để xem',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 10),


                    GestureDetector(
                      onTap: _openGitHub,
                      child: Text(
                        githubUrl,
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              menuItem(context, Icons.class_, 'Bài 1', const MyPlace()),
              menuItem(context, Icons.flight, 'Bài 2', const Manhinhdidong()),
              menuItem(context, Icons.place, 'Bài 3', const HotelListPage()),
              menuItem(context, Icons.palette, 'Bài 4', const ChangeColorApp()),
              menuItem(context, Icons.exposure, 'Bài 5', const CounterApp()),
              menuItem(context, Icons.exposure, 'Bài 6', const CountdownTimerApp()),
              menuItem(context, Icons.person_add, 'Bài 7', const FormDangKy()),
              menuItem(context, Icons.login, 'Bài 8', const FormDangNhap()),
              menuItem(context, Icons.sell, 'Bài 9', const MyProduct()),
              menuItem(context, Icons.newspaper, 'Bài 10', const NewsApp()),
              menuItem(context, Icons.lock_open, 'Bài 11', const LoginProfile()),
            ],
          ),
        ),
      );

  static Widget menuItem(BuildContext context, IconData icon, String title, Widget page) =>
      ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      );
}