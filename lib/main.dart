import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/shopping_list_screen.dart';
import 'services/shopping_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoppingService(),
      child: MaterialApp(
        title: 'Shopping List',
        home: ShoppingListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ); 
  }
  
}
