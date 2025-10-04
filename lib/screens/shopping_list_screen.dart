import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Aqui vai a lista de compras'),
      ),
    );
  }
}