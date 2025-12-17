import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        title: const Text('Danh sách lớp học'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          blockItem("XML và ứng dụng - Nhóm 1", "2025–2026.1.TIN4583.001", "58 học viên", Colors.grey.shade700),
          blockItem("Lập trình ứng dụng cho các thiết bị di động - Nhóm 1", "2025–2026.1.TIN4403.006", "55 học viên", Colors.amberAccent),
          blockItem("Lập trình ứng dụng cho các thiết bị di động - Nhóm 2", "2025–2026.1.TIN4403.005", "52 học viên", Colors.grey.shade700),
          blockItem("Lập trình ứng dụng cho các thiết bị di động - Nhóm 3", "2025–2026.1.TIN4403.004", "50 học viên", const Color(0xFF2563EB)),
          blockItem("Lập trình ứng dụng cho các thiết bị di động - Nhóm 4", "2025–2026.1.TIN4403.003", "52 học viên", Colors.lightBlueAccent),
        ],
      ),
    );
  }


  Widget blockItem(String title, String code, String students, Color bgColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
          const SizedBox(height: 6),


          Text(
            code,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),

          const SizedBox(height: 24),


          Text(
            students,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }
}