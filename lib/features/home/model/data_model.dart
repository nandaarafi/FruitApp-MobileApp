class ProductDataModel {
  String? id;
  String? image;
  String? fruit;
  String? price;
  // String? nutrision;
  HomeDetails? home;
  ProductDetails? details;

  ProductDataModel({
    this.id,
    this.image,
    this.fruit,
    this.price,
    this.home,
    this.details,
    // this.nutrision,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      image = json['image'];
      fruit = json['fruit'];
      price = json['price'];


      // Parse nested 'home' and 'details'
      if (json['home'] != null) {
        home = HomeDetails.fromJson(json['home']);
      }

      // Check for null or missing 'details' key
      if (json['details'] != null) {
        details = ProductDetails.fromJson(json['details']);
      }
    }
  }
}

class HomeDetails {
  String? subtitle;

  HomeDetails({
    this.subtitle,
  });

  HomeDetails.fromJson(Map<String, dynamic> json) {
    subtitle = json['subtitle'];
  }
}

class ProductDetails {
  String? description;
  String? expired;
  String? nutrision;

  ProductDetails({
    this.description,
    this.expired,
    this.nutrision,
  });

  ProductDetails.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    expired = json['expired'];
    nutrision = json['nutrition'];
  }
}

// ProductDataModel Product = ProductDataModel.fromJson(
//   {
//     "id": "1",
//     "image": "https://plus.unsplash.com/premium_photo-1671379528112-7b19c77a1d58?q=80&w=1881&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "fruit": "Banana",
//     "price": "Rp 50000",
//     "home": {
//       "subtitle": "Taste the difference 25% of all nuts"
//     },
//     "details": {
//       "description": "Bananas are a nutritious and delicious fruit, known for their distinctive curved shape and sweet taste. They are rich in vitamins, minerals, and dietary fiber, making them an excellent snack for any time of the day, Our bananas are carefully selected to ensure the highest quality",
//       "expired": "2 Weeks",
//       "nutrition": "Serving Size: 1 medium mango (200g) Calories 60 Total Fat: 0g Sodium: 0mg Total Carbohydrate: 15g Dietary Fiber: 3g Total Sugars: 12g Protein: 1g"
//     }
//   },
// );
//
// String? expire = Product.details?.expired;

