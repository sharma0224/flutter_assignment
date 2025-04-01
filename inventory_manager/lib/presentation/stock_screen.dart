import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/inventory_bloc.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stock In/Out")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: "Item Name")),
            TextField(controller: _quantityController, decoration: InputDecoration(labelText: "Quantity"), keyboardType: TextInputType.number),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final quantity = int.tryParse(_quantityController.text) ?? 0;
                context.read<InventoryBloc>().add(UpdateStock(name, quantity));
                Navigator.pop(context);
              },
              child: Text("Update Stock"),
            ),
          ],
        ),
      ),
    );
  }
}
