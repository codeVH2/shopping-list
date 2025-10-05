import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/shopping_service.dart';
import '../widgets/shopping_item_tile.dart';
import '../widgets/add_item_dialog.dart';

class ShoppingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoppingService = Provider.of<ShoppingService>(context); //listen to changes

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
          ),
        backgroundColor: const Color.fromARGB(255, 22, 86, 142),
        centerTitle: true,
      ),
      
      body: shoppingService.items.isEmpty
          ? _noItemListed()
          : _ItemListed(shoppingService),

      floatingActionButton: _addItemButton(context, shoppingService),
    );
  }

  FloatingActionButton _addItemButton(BuildContext context, ShoppingService shoppingService) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AddItemDialog( //create an instance of AddItemDialog
            onAdd: (name, quantity) { //function as parameter to AddItemDialog
              shoppingService.addItem(name, quantity);
            },
          ),
        );
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }

  ListView _ItemListed(ShoppingService shoppingService) {
    return ListView.builder( //if the list is not empty, show the list
            itemCount: shoppingService.items.length + 1,
            itemBuilder: (context, index) {
              if(index == shoppingService.items.length){
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text('Are you sure you want to clear all items?', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          backgroundColor: const Color.fromARGB(255, 139, 169, 185),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('NO', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                shoppingService.clearList();
                              },
                             child: Text('YES', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
                             ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 227, 135, 129),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    child: Text('Clear List')
                  )
                  );
              }
              else{
                return ShoppingItemTile(
                  item: shoppingService.items[index],
                  onToggle: () => shoppingService.togglePurchased(index),
                  onIncrease: () => shoppingService.increaseQuantity(index),
                  onDecrease: () => shoppingService.decreaseQuantity(index),
                  onRemove: () => shoppingService.removeItem(index),
                );
              }
            },
          );
  }

  Center _noItemListed() {
    return Center( //if the list is empty, show this text
            child: Text(
              'No items yet!\nTap + to add items',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
  }
}