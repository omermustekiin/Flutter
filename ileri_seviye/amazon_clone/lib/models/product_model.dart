class ProductModel {
  final String url;
  final String productName;
  final double cost;
  final int discount;
  final String uuid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int numberOfRating;

  ProductModel({
    required this.url,
    required this.productName,
    required this.cost,
    required this.discount,
    required this.uuid,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.numberOfRating,
  });

  Map<String, dynamic> getJson() {
    return {
      'url': url,
      'productName': productName,
      'cost': cost,
      'discount': discount,
      'uuid': uuid,
      'sellerName': sellerName,
      'sellerUid': sellerUid,
      'rating': rating,
      'numberOfRating': numberOfRating,
    };
  }

  factory ProductModel.getModelFromJson({required Map<String, dynamic> json}) {
    return ProductModel(
        url: json["url"],
        productName: json["productName"],
        cost: json["cost"],
        discount: json["discount"],
        uuid: json["uuid"],
        sellerName: json["sellerName"],
        sellerUid: json["sellerUid"],
        rating: json["rating"],
        numberOfRating: json["numberOfRating"]);
  }
}
