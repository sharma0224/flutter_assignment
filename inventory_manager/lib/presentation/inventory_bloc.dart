import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/inventory_repository.dart';
import '../domain/inventory_model.dart';
import 'inventory_state.dart';

abstract class InventoryEvent {}

class FetchInventory extends InventoryEvent {}

class UpdateStock extends InventoryEvent {
  final String name;
  final int newQuantity;
  UpdateStock(this.name, this.newQuantity);
}

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepository _repository = InventoryRepository();

  InventoryBloc() : super(InventoryLoadingState()) {
    on<FetchInventory>((event, emit) async {
      emit(InventoryLoadingState());
      try {
        final inventory = await _repository.getInventory();
        emit(InventoryLoadedState(inventory));
      } catch (e) {
        emit(InventoryErrorState(e.toString()));
      }
    });

    on<UpdateStock>((event, emit) async {
      await _repository.updateStock(event.name, event.newQuantity);
      add(FetchInventory());
    });
  }
}
