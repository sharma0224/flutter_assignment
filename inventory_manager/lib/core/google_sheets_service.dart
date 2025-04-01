import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleSheetsService {
  static const String scriptUrl =
      "https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec";

  Future<List<Map<String, dynamic>>> fetchInventory() async {
    final response = await http.get(Uri.parse('$scriptUrl?action=getInventory'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load inventory");
    }
  }

  Future<void> updateStock(String name, int newQuantity) async {
    await http.post(
      Uri.parse(scriptUrl),
      body: jsonEncode({"action": "updateStock", "name": name, "quantity": newQuantity}),
      headers: {"Content-Type": "application/json"},
    );
  }
}
