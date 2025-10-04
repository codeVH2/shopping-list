import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list/services/shopping_service.dart';

void main() {
  group('ShoppingService', () {
    test('should add item', () {
      final service = ShoppingService();

      service.addItem('Milk', 2);

      expect(service.items.length, 1);
      expect(service.items[0].name, 'Milk');
      expect(service.items[0].quantity, 2);
    });

    test('should increase quantity', () {
      final service = ShoppingService();
      service.addItem('Bread', 1);

      service.increaseQuantity(0);

      expect(service.items[0].quantity, 2);
    });

    test('should remove item', () {
      final service = ShoppingService();
      service.addItem('Eggs', 12);

      service.removeItem(0);

      expect(service.items.length, 0);
    });

    test('should toggle purchased', () {
      final service = ShoppingService();
      service.addItem('Cheese', 1);

      service.togglePurchased(0);

      expect(service.items[0].isPurchased, true);

      service.togglePurchased(0);

      expect(service.items[0].isPurchased, false);
    });

    test('should do everything', (){

      final service = ShoppingService();

      service.addItem('Apples', 5);
      service.addItem('Bananas', 3);
      service.addItem('aaa', 1);

      expect(service.items.length, 3);

      service.increaseQuantity(1);
      expect(service.items[1].quantity, 4);

      service.removeItem(2);
      expect(service.items.length, 2);
      
      service.togglePurchased(0);
      expect(service.items[0].isPurchased, true);
      service.togglePurchased(1);
      expect(service.items[1].isPurchased, true);

      service.clearList();
      expect(service.items.length, 0);

    });

  });
}
