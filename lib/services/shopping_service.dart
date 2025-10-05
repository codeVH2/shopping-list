import 'package:flutter/material.dart';
import '../data/shopping_item.dart';



class ShoppingService extends ChangeNotifier {
  List<ShoppingItem> _items = [];

  List<ShoppingItem> get items => _items;

  void addItem(String name, int quantity) {
    int pos = _items.indexWhere((item){ //return index if the item exists already
      return item.name.toLowerCase() == name.toLowerCase();
    });

    if(pos != -1){
      //if it exists already
      _items[pos] = _items[pos].copyWith(quantity: _items[pos].quantity + quantity);
    }else {
      //if doesnt exist
      _items.add(ShoppingItem(name: name, quantity: quantity));
    }

    notifyListeners();  // Notify listeners about the change
  }

  void increaseQuantity(int index) {
    if (index >= 0 && index < _items.length) {
      _items[index] = _items[index].copyWith(quantity: _items[index].quantity + 1); //only change the quantity field
    }

    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);

    notifyListeners();
  }

  void togglePurchased(int index) {
    if (index >= 0 && index < _items.length) {
      _items[index] = _items[index].copyWith(isPurchased: !_items[index].isPurchased);  //only change the isPurchased field
    }

    notifyListeners();
  }

  void clearList() {  //clear the shopping list
    _items.clear();
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if(index >= 0 && index < _items.length){
      if(_items[index].quantity == 1){
       removeItem(index);
      }else{
        _items[index] = _items[index].copyWith(quantity: _items[index].quantity - 1);
      }
    }

    notifyListeners();
  }
}