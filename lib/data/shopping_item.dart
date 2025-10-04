




class ShoppingItem {
  final String name;
  final int quantity;
  final bool isPurchased;

  ShoppingItem({
    required this.name,
    required this.quantity,
    this.isPurchased = false,
  });

  ShoppingItem copyWith({
    String? name,
    int? quantity,
    bool? isPurchased,
  }) {
    return ShoppingItem(
      name: name ?? this.name, // ?? means that if the parameter is null, use the current value
      quantity: quantity ?? this.quantity,
      isPurchased: isPurchased ?? this.isPurchased,
    );
  }
}