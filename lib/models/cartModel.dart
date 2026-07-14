class CartModel {
  final List<Cart> carts;
  final int total;
  final int skip;
  final int limit;

  CartModel({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      carts: (json['carts'] as List)
          .map((e) => Cart.fromJson(e))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Cart {
  final int id;
  final List<CartProduct> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      products: (json['products'] as List)
          .map((e) => CartProduct.fromJson(e))
          .toList(),
      total: (json['total'] as num).toDouble(),
      discountedTotal:
      (json['discountedTotal'] as num).toDouble(),
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }
}

class CartProduct {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      total: (json['total'] as num).toDouble(),
      discountPercentage:
      (json['discountPercentage'] as num).toDouble(),
      discountedTotal:
      (json['discountedTotal'] as num).toDouble(),
      thumbnail: json['thumbnail'],
    );
  }
}