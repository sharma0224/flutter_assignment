import '../domain/inventory_model.dart';

abstract class InventoryState {}

class InventoryLoadingState extends InventoryState {}

class InventoryLoadedState extends InventoryState {
  final List<InventoryItem> inventory;
  InventoryLoadedState(this.inventory);
}

class InventoryErrorState extends InventoryState {
  final String message;
  InventoryErrorState(this.message);
}
