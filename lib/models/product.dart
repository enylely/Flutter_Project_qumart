class Product {
  final String id;
  final String name;
  final String price;
  final String imageUrl;

  Product({required this.id, required this.name, required this.price, required this.imageUrl});

  factory Product.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      name: data['name'] ?? '',
      price: data['price'] ?? 0.0,
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
