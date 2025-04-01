import '../core/google_sheets_service.dart';
import '../domain/inventory_model.dart';

class InventoryRepository {
  final GoogleSheetsService _sheetsService = GoogleSheetsService();

  Future<List<InventoryItem>> getInventory() async {
    final data = await _sheetsService.fetchInventory();
    return data.map((item) {
      return InventoryItem(
        name: item['name'],
        quantity: int.parse(item['quantity']),
        price: double.parse(item['price']),
        threshold: int.parse(item['threshold']),
      );
    }).toList();
  }

  Future<void> updateStock(String name, int quantity) async {
    await _sheetsService.updateStock(name, quantity);
  }
}
