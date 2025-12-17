import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color bgColor = Colors.purple;
  String colorName = "Tím";

  final List<Map<String, dynamic>> colorList = [
    {"color": Colors.red, "name": "Đỏ"},
    {"color": Colors.yellow, "name": "Vàng"},
    {"color": Colors.blue, "name": "Xanh dương"},
    {"color": Colors.pink, "name": "Hồng"},
    {"color": Colors.purple, "name": "Tím"},
    {"color": Colors.green, "name": "Xanh lá"},
    {"color": Colors.orange, "name": "Cam"},
  ];

  void _changeRandomColor() {
    setState(() {
      var random = Random();
      Map<String, dynamic> chosen;

      // Chọn màu khác màu hiện tại
      do {
        chosen = colorList[random.nextInt(colorList.length)];
      } while (chosen["color"] == bgColor);

      bgColor = chosen["color"];
      colorName = chosen["name"];
    });
  }

  void _resetColor() {
    setState(() {
      bgColor = Colors.yellow;
      colorName = "Vàng";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng Đổi màu nền"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Màu hiện tại",
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                colorName,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _changeRandomColor,
                    icon: const Icon(Icons.color_lens),
                    label: const Text("Đổi màu"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: _resetColor,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Đặt lại"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}