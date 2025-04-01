import 'package:flutter/material.dart';
import '../domain/inventory_model.dart';

class InventoryItemWidget extends StatelessWidget {
  final InventoryItem item;
  
  const InventoryItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text("Quantity: ${item.quantity}"),
      trailing: Text("\$${item.price.toStringAsFixed(2)}"),
    );
  }
}
