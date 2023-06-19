class VehiclePart {
  String name;
  String company;
  double price;
  String image;
  String description;

  VehiclePart({
    required this.name,
    required this.company,
    required this.image,
    required this.price,
    required this.description,
  });

  factory VehiclePart.fromJson(Map<String, dynamic> json) {
    print(json);
    return VehiclePart(
      name: json['part-name'],
      company: json['company'],
      description: json['description'],
      image: json['image'],
      price: double.parse(json['price'].toString()),
    );
  }

  //to JSON
  Map<String, dynamic> toJson() => {
        'part-name': name,
        'company': company,
        'image': image,
        'price': price,
      };
}
