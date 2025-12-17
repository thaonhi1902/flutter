import 'package:flutter/material.dart';

class ToolItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const ToolItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.black87, size: 20),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = [
      {
        'name': 'aNhill Boutique',
        'rating': 9.5,
        'review': 'Xuất sắc',
        'reviewCount': 95,
        'city': 'Huế',
        'distance': '0,6km',
        'room': '1 suite riêng tư: 1 giường',
        'price': 'US\$109',
        'image':
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/606510571.jpg?k=728b23fdc60e1b2b5c588d2f93c8b7ecb8e41cf92b7ccf906da0a6ea917ec353&o=',
        'breakfast': true,
        'stars': 5,
      },
      {
        'name': 'An Nam Hue Boutique',
        'rating': 9.2,
        'review': 'Tuyệt hảo',
        'reviewCount': 34,
        'city': 'Cư Chinh',
        'distance': '0,9km',
        'room': '1 phòng khách sạn: 1 giường',
        'price': 'US\$20',
        'image':
            'https://images.unsplash.com/photo-1645167114522-2db13f2ab9d4?q=80&w=1169&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'breakfast': true,
        'stars': 4,
      },
      {
        'name': 'Huế Jade Hill Villa',
        'rating': 8.0,
        'review': 'Rất tốt',
        'reviewCount': 1,
        'city': 'Cư Chinh',
        'distance': '1,3km',
        'room':
            '1 biệt thự nguyên căn – 1.000 m²\n4 giường • 3 phòng ngủ • 1 phòng khách • 1 phòng tắm',
        'price': 'US\$285',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxqYNTgkHMpQMHAo4zl881wrFco9Hc_RDUyw&s',
        'breakfast': false,
        'stars': 4,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- THANH TIÊU ĐỀ ----------
          Container(
            color: const Color(0xFF003580),
            padding: const EdgeInsets.only(top: 40, bottom: 12),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xFFFFC107), width: 2),
                  ),

                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Xung quanh vị trí hiện tại   23 thg 10 – 24 thg 10',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          //overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ToolItem(icon: Icons.swap_vert, label: 'Sắp xếp'),
                      ToolItem(icon: Icons.tune, label: 'Lọc'),
                      ToolItem(icon: Icons.map_outlined, label: 'Bản đồ'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              '757 chỗ nghỉ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),

          // ---------- DANH SÁCH KHÁCH SẠN ----------
          Expanded(
            child: ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> hotel = hotels[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Ảnh khách sạn bên trái
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  hotel['image'].toString(),
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stack) =>
                                      Container(
                                    height: 140,
                                    color: Colors.grey[300],
                                    child:
                                        const Icon(Icons.image_not_supported),
                                  ),
                                ),
                                if (hotel['breakfast'] == true)
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.green[700],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text(
                                        'Bao bữa sáng',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                        // Thông tin khách sạn bên phải
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hotel['name'].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: List.generate(
                                    hotel['stars'] as int,
                                    (i) => const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF003580),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        hotel['rating'].toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${hotel['review']} · ${hotel['reviewCount']} đánh giá',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${hotel['city']} · ${hotel['distance']}',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  hotel['price'].toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  'Đã bao gồm thuế và phí',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
