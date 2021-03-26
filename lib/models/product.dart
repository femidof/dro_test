import '../index.dart';

class Product {
  bool showMore;
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
  int subTotal = 0;
  int quantity = 0;
  int unitPackSize;
  int packSizeComplete;

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
    this.quantity,
    this.subTotal,
    this.unitPackSize,
    this.packSizeComplete,
    this.showMore = false,
  });
}
