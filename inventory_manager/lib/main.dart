import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/inventory_bloc.dart';
import 'presentation/home_screen.dart';
import 'presentation/stock_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => InventoryBloc()..add(FetchInventory()),
      child: MaterialApp(
        home: HomeScreen(),
        routes: { '/stock': (context) => StockScreen() },
      ),
    ),
  );
}
