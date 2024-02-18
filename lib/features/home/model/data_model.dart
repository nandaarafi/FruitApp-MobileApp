class ProductDataModel {
  String? id;
  String? image;
  String? title;
  String? subtitle;
  String? price;

  ProductDataModel({
    this.id,
    this.image,
    this.title,
    this.subtitle,
    this.price,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    subtitle = json['subtitle'];
    price = json['price'];
  }
}
