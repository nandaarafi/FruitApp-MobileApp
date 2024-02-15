class ProductDataModel{
  int? id;
  String? title;
  String? subtitle;
  String? imageURL;

  ProductDataModel(
      {
        this.id,
        this.title,
        this.subtitle,
        this.imageURL,
      });

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    title =json['title'];
    subtitle = json['subtitle'];
    imageURL = json['imageUrl'];
  }
}