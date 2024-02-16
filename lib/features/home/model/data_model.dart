class ProductDataModel {
  String? id;
  String? image;
  String? title;
  String? subtitle;

  ProductDataModel({
    this.id,
    this.image,
    this.title,
    this.subtitle,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    subtitle = json['subtitle'];
  }
}
