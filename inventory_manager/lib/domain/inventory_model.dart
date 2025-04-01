class InventoryItem {
  final String name;
  int quantity;
  final double price;
  final int threshold;

  InventoryItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.threshold,
  });

  bool get isLowStock => quantity < threshold;
}
