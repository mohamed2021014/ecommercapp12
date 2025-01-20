class CartItem {
  String name;
  String image;
  double price;
  int quantity;

  CartItem({required this.name, required this.image, required this.price, this.quantity = 1});

  // تحويل العنصر إلى Map لتخزينه في SharedPreferences
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  // تحويل الخريطة إلى CartItem
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      name: map['name'],
      image: map['image'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }
}