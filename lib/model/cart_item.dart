class CartItem {
  String name;
  String company;
  double price;
  String image;
  String status;

  CartItem({
    required this.name,
    required this.company,
    required this.price,
    required this.image,
    required this.status,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    print(json);
    return CartItem(
      name: json['item-name'],
      company: json['item-company'],
      image: json['image'],
      price: double.parse(json['item-price'].toString()),
      status: json['status'],
    );
  }

  //to JSON
  Map<String, dynamic> toJson() => {
        'item-name': name,
        'item-company': company,
        'image': image,
        'item-price': price,
        'status': status,
      };
}
