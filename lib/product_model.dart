class Product {
  final String id;
  final String name;
  final String photo;
  final String price;       // เพิ่มราคา
  final String weight;      // เพิ่มน้ำหนัก
  final String description; // เพิ่มรายละเอียด

  Product({
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
    required this.weight,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? 'ไม่มีชื่อสินค้า',
      photo: json['photo'] ?? '',
      // แปลงเป็น String เสมอ เพื่อป้องกัน error กรณี API ส่งมาเป็นตัวเลข
      price: (json['price'] ?? '0').toString(),
      weight: (json['weight'] ?? '0').toString(),
      description: json['description'] ?? 'ไม่มีรายละเอียด',
    );
  }
}