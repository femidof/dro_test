import 'package:dro_health/index.dart';

class Cart with ChangeNotifier {
  List<Product> _cartProductlist = [];

  Map<Product, int> _cartProductMap = {
    Product(
      type: "Tablet",
      measure: "125mg",
      packSize: "3x10",
      constituent: ["water", "Vitamins"],
      description: "Citric Acid",
      dispenseIn: "Bottle",
      nameOfProduct: "Orange Juice",
      price: 2000,
      productId: "In34hsdkihksf",
      seller: "Jason Lolo",
      sellerImage:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      productImage:
          "https://images.unsplash.com/photo-1585611680828-24e7b3608ce3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8b3JhbmdlJTIwanVpY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    ): 1,
  };

  int _totalCost = 0;
  void add(Product product) {
    if (_cartProductMap.containsKey(product)) {
      _cartProductMap.update(product, (value) => value++);
    } else {
      _cartProductMap[product] = 1;
    }
    for (Product product in _cartProductMap.keys) {
      _totalCost += product.price;
    }
    notifyListeners();
  }

  int get countProduct {
    return _cartProductlist.length;
  }

  int get totalprice {
    return _totalCost;
  }

  List<Product> get productsInCart {
    return _cartProductMap.entries.map((element) => _cartProductlist.add(
        Product(
            nameOfProduct: element.key.nameOfProduct,
            price: element.key.price,
            productImage: element.key.productImage,
            description: element.key.description,
            productId: element.key.productId,
            seller: element.key.seller,
            dispenseIn: element.key.dispenseIn,
            constituent: element.key.constituent,
            sellerImage: element.key.sellerImage,
            packSize: element.key.packSize,
            type: element.key.type,
            measure: element.key.measure)));
  }
}
