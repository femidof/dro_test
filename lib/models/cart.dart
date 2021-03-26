import 'package:dro_health/index.dart';

class Cart with ChangeNotifier {
  List<Product> _cartProductlist = [];
  List<String> _productUIds = [];

  int _cartTotal = 0;
  int _cartTotalProductCount = 0;

  toggleShowMore(Product product) {
    if (product.showMore) {
      _cartProductlist.forEach((element) {
        element.showMore = false;
      });
    } else {
      _cartProductlist.forEach((element) {
        element.showMore = false;
      });
      product.showMore = !product.showMore;
    }
    notifyListeners();
  }

  void addToCart(
      {@required Product product,
      @required String productId,
      @required int unitPrice,
      @required int quantity}) {
    bool notInCart = false;
    if (_cartProductlist.isEmpty) {
      product.quantity = quantity;
      product.subTotal = quantity * unitPrice;
      _cartTotal = _cartTotal + product.subTotal;
      _productUIds.add(productId);
      _cartProductlist.add(product);
    } else {
      _cartProductlist.forEach((element) {
        if (element.productId == productId) {
          element.quantity += quantity;
          product.subTotal = quantity * unitPrice;
          _cartTotal = _cartTotal + product.subTotal;
        } else {
          notInCart = true;
        }
      });
    }
    if (notInCart) {
      product.quantity = quantity;
      product.subTotal = quantity * unitPrice;
      _cartTotal = _cartTotal + product.subTotal;
      _productUIds.add(productId);
      _cartProductlist.add(product);
      notInCart = false;
    }
    notifyListeners();
  }

  int get countProduct {
    _cartTotalProductCount = 0;
    _cartProductlist.forEach((element) {
      _cartTotalProductCount += element.quantity;
    });
    return _cartTotalProductCount;
  }

  deleteItemFromCart(
    int index,
  ) {
    for (int i = _cartProductlist[index].quantity; i > 0; i--) {
      decrementItemFromCart(index);
    }
    notifyListeners();
  }

  decrementItemFromCart(int index) {
    if (_cartProductlist[index].quantity > 1) {
      _cartProductlist[index].quantity = --_cartProductlist[index].quantity;
      _cartProductlist[index].subTotal =
          (_cartProductlist[index].quantity * _cartProductlist[index].price);
    } else {
      _cartProductlist.removeAt(index);
    }
    notifyListeners();
  }

  incrementItemToCart(int index) {
    _cartProductlist[index].quantity = ++_cartProductlist[index].quantity;
    _cartProductlist[index].subTotal =
        (_cartProductlist[index].quantity * _cartProductlist[index].price);
    notifyListeners();
  }

  List<Product> get productsInCart {
    return _cartProductlist;
  }

  int get cartSubtotal {
    _cartTotal = 0;
    _cartProductlist
        .forEach((element) => _cartTotal += element.quantity * element.price);
    return _cartTotal;
  }
}
