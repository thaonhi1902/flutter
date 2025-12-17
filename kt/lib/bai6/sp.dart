class Product {
  final String? title;
  final String? image;
  final double? price;
  final double? rating;

  Product({
     this.title,
     this.image,
     this.price,
     this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      price: _toDouble(json['price']),
      rating: _toDouble(json['rating'], defaultValue: 4.5),
    );
  }

  static double _toDouble(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? defaultValue;
    return defaultValue;
  }
}