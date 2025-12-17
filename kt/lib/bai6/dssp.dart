import 'package:flutter/material.dart';
import 'package:lap/bai6/api_sp.dart';
import 'package:lap/bai6/sp.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});
  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  final List<Product> cart = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text("Shoppee", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 255, 177, 68),
          centerTitle: true,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage(cart: cart)),
              ),
            ),
          ],
        ),
        body: FutureBuilder<List<Product>>(
          future: testApi.getAllProduct(),
          builder: (context, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) return Center(child: Text("Lỗi: ${snap.error}"));
            final data = snap.data ?? [];
            if (data.isEmpty) {
              return const Center(child: Text("Không có sản phẩm nào."));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: data.length,
              itemBuilder: (_, i) => _item(data[i]),
            );
          },
        ),
      );

  Widget _item(Product p) {
    final img = (p.image?.trim().isNotEmpty ?? false)
        ? p.image!
        : "https://via.placeholder.com/150";

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ProductDetailPage(product: p, addToCart: () => _addToCart(p)),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child:
                Image.network(img, width: 100, height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p.title ?? "Sản phẩm",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              const SizedBox(height: 4),
              Text("${(p.price ?? 0).toStringAsFixed(0)} ₫",
                  style: const TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              Row(children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                Text((p.rating ?? 4.5).toStringAsFixed(1),
                    style: const TextStyle(fontSize: 13)),
                const Spacer(),
                IconButton(
                    icon: const Icon(Icons.add_shopping_cart,
                        color: Colors.blueAccent),
                    onPressed: () => _addToCart(p)),
              ])
            ]),
          ),
        ]),
      ),
    );
  }

  void _addToCart(Product p) {
    setState(() => cart.add(p));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Đã thêm '${p.title}' vào giỏ hàng!")),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final VoidCallback addToCart;
  const ProductDetailPage({super.key, required this.product, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    final img = (product.image?.trim().isNotEmpty ?? false)
        ? product.image!
        : "https://via.placeholder.com/150";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết sản phẩm"),
        backgroundColor: const Color.fromARGB(255, 255, 177, 68),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Image.network(img, height: 230, fit: BoxFit.contain),
          ),
          const SizedBox(height: 20),
          Text(product.title ?? "Sản phẩm",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("${(product.price ?? 0).toStringAsFixed(0)} ₫",
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 177, 68),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const SizedBox(height: 8),
          Row(children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            Text((product.rating ?? 4.5).toStringAsFixed(1)),
          ]),
          const SizedBox(height: 20),
          const Text("Mô tả sản phẩm",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Sản phẩm chất lượng cao, thiết kế đẹp, giá hợp lý.",
              style: TextStyle(color: Colors.black54)),
          const Spacer(),
          ElevatedButton.icon(
            icon: const Icon(Icons.shopping_cart),
            label: const Text("Thêm vào giỏ hàng"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 177, 68),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
            ),
            onPressed: () {
              addToCart();
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> cart;
  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Giỏ hàng"),
          backgroundColor: const Color.fromARGB(255, 255, 177, 68),
          foregroundColor: Colors.white,
        ),
        body: cart.isEmpty
            ? const Center(child: Text("Chưa có sản phẩm nào trong giỏ."))
            : ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: cart.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) {
                  final p = cart[i];
                  final img = (p.image?.trim().isNotEmpty ?? false)
                      ? p.image!
                      : "https://via.placeholder.com/150";
                  return ListTile(
                    leading: Image.network(img, width: 50, fit: BoxFit.cover),
                    title: Text(p.title ?? "Sản phẩm"),
                    subtitle: Text("${(p.price ?? 0).toStringAsFixed(0)} ₫"),
                  );
                },
              ),
      );
}