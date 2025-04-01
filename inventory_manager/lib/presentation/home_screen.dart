import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/inventory_bloc.dart';
import '../presentation/inventory_state.dart'; // ✅ Import the correct InventoryState file
import '../widgets/inventory_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inventory Manager")),
      body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          if (state is InventoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is InventoryErrorState) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is InventoryLoadedState) {
            return ListView.builder(
              itemCount: state.inventory.length,
              itemBuilder: (context, index) {
                return InventoryItemWidget(item: state.inventory[index]);
              },
            );
          }
          return const Center(child: Text("No Data Available"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/stock');
        },
      ),
    );
  }
}
