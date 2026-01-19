import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ApiService { // แก้ชื่อ Class เป็น S ตัวใหญ่ตามมาตรฐาน

  static Future<List<Product>> fetchProduct() async {
    // URL ของคุณ
    final response = await http.get(Uri.parse("https://6964b1f9e8ce952ce1f28af3.mockapi.io/products"));

    if (response.statusCode == 200) {
      final List data = jsonDecode(utf8.decode(response.bodyBytes)); // ใช้ utf8.decode รองรับภาษาไทย
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      // *** แก้คำหยาบออกแล้วครับ เพื่อความสุภาพเวลาส่งงาน ***
      throw Exception('โหลดข้อมูลไม่สำเร็จ (Status: ${response.statusCode})');
    }
  }
}