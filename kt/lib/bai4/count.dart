import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;

  void _increase() {
    setState(() {
      counter++;
    });
  }

  void _decrease() {
    setState(() {
      counter--;
    });
  }

  void _reset() {
    setState(() {
      counter = 0;
    });
  }

  Color _getColor() {
    if (counter > 0) return Colors.green;
    if (counter < 0) return Colors.red;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng Đếm số"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Giá trị hiện tại:",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "$counter",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: _getColor(),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _decrease,
                  icon: const Icon(Icons.remove),
                  label: const Text("Giảm"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Đặt lại"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: _increase,
                  icon: const Icon(Icons.add),
                  label: const Text("Tăng"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
