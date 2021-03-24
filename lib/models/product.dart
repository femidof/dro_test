import '../index.dart';

class Product {
  String productImage;
  String nameOfProduct;
  String description;
  String seller;
  String sellerImage;
  int price;
  List constituent;
  String dispenseIn;
  String productId;
  String packSize;
  String type;
  String measure;

  Product({
    @required this.nameOfProduct,
    @required this.price,
    @required this.productImage,
    @required this.description,
    @required this.productId,
    @required this.seller,
    @required this.dispenseIn,
    @required this.constituent,
    @required this.sellerImage,
    @required this.packSize,
    @required this.type,
    @required this.measure,
  });
}
