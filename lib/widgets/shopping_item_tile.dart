import 'package:flutter/material.dart';
import '../data/shopping_item.dart';

class ShoppingItemTile extends StatelessWidget {
  final ShoppingItem item;
  final VoidCallback onToggle;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const ShoppingItemTile({
    required this.item,
    required this.onToggle,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: item.isPurchased,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            decoration: item.isPurchased ? TextDecoration.lineThrough : null,
            color: item.isPurchased ? Colors.grey : Colors.black,
          ),
        ),
        subtitle: Text('Quantity: ${item.quantity}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: onIncrease,
              color: Colors.blue,
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: onDecrease,
              color: Colors.blue,
              ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onRemove,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
