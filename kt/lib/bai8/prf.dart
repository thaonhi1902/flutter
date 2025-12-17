import 'package:flutter/material.dart';
import 'login.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  const ProfileScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Đăng xuất",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginProfile()),
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đăng xuất thành công')),
              );
            },
          ),
        ],
      ),

      // 🔽 Thân trang hiển thị thông tin người dùng
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 🧍‍♀️ Ảnh đại diện
            CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(
                userData['image'] ??
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
              ),
            ),
            const SizedBox(height: 16),

            // 🧾 Họ tên
            Text(
              '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            // 📧 Email
            Text(
              userData['email'] ?? 'Không có email',
              style: const TextStyle(color: Colors.black54, fontSize: 15),
            ),

            const SizedBox(height: 25),

            // 🟩 Thông tin chi tiết
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    infoRow(Icons.person, "Tên đăng nhập",
                        userData['username'] ?? 'Không có'),
                    const Divider(),
                    infoRow(Icons.wc, "Giới tính",
                        userData['gender'] ?? 'Không rõ'),
                    const Divider(),
                    infoRow(Icons.email_outlined, "Email",
                        userData['email'] ?? 'Không có'),
                    const Divider(),
                    infoRow(Icons.badge, "Họ tên đầy đủ",
                        '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 🔴 Nút đăng xuất
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginProfile()),
                  (route) => false,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đăng xuất thành công')),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Đăng xuất'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🧩 Widget nhỏ để hiển thị từng dòng thông tin
  Widget infoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            '$title: $value',
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}