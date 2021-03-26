import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:dro_health/dummyData/products.dart';
import 'package:dro_health/index.dart';
import 'package:dro_health/models/product.dart';
import 'package:dro_health/screens/widgets/product_detail.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int added = 0;
  bool sort = false;
  bool searchBar = false;
  bool filter = true;
  String searchText = "";
  TextEditingController textController = TextEditingController();
  List<Product> cart = [];
  List<Product> _searchResult = [];
  FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  void toggleSearch() {
    if (searchBar == true) {
      setState(() {
        searchBar = false;
      });
    } else {
      setState(() {
        searchBar = true;
        searchFocusNode.requestFocus();
      });
    }
  }

  void toggleSort() {
    if (sort == true) {
      setState(() {
        sort = false;
      });
    } else {
      setState(() {
        sort = true;
      });
    }
  }

  void toggleFilter() {
    if (filter == true) {
      setState(() {
        filter = false;
      });
    } else {
      setState(() {
        filter = true;
      });
    }
  }

  onSearchTextChanged(String text) async {
    setState(() {
      _searchResult.clear();
    });
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    products.forEach((products) {
      if (products.nameOfProduct.toLowerCase().contains(text.toLowerCase()) ||
          products.description.toLowerCase().contains(text.toLowerCase()))
        setState(() {
          _searchResult.add(products);
        });
    });

    setState(() {});
  }

  void addToCart(Product product) {
    cart.add(product);
  }

  @override
  Widget build(BuildContext context) {
    void gotoproductDetailsPage(Product product) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return ProductDetail(
            product: product,
          );
        },
      ));
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: DraggableBottomSheet(
        minExtent: 80.0,
        expansionExtent: 200,
        maxExtent: size.height * 0.95,
        previewChild: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
              color: UniversalVariables.darkPurple),
          child: Column(
            children: [
              ContainerTop(),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BagWidget(),
                    counterWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
        expandedChild: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
            color: UniversalVariables.darkPurple,
          ),
          child: Column(
            children: [
              ContainerTop(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      BagWidget(),
                    ],
                  ),
                  Column(
                    children: [
                      counterWidget(),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Consumer<Cart>(
                builder: (context, value, child) {
                  return value.countProduct != 0
                      ? Container(
                          padding: EdgeInsets.only(
                              left: 14, right: 14, top: 6, bottom: 6),
                          child: Text(
                            "Tap on an item for add, remove, delete options",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      : Container();
                },
              ),
              SizedBox(
                height: 18,
              ),

              // Products in cart
              Flexible(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Consumer<Cart>(
                        builder: (context, cart, child) {
                          return ListView.builder(
                            padding: EdgeInsets.all(9),
                            itemCount: cart.productsInCart.length,
                            itemBuilder: (context, index) {
                              bool showMore =
                                  cart.productsInCart.elementAt(index).showMore;
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      cart.toggleShowMore(
                                          cart.productsInCart.elementAt(index));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    cart.productsInCart
                                                        .elementAt(index)
                                                        .productImage)),
                                            SizedBox(
                                              width: 17,
                                            ),
                                            // Quantity
                                            Text(
                                              cart.productsInCart
                                                      .elementAt(index)
                                                      .quantity
                                                      .toString() +
                                                  "X",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 17,
                                            ),
                                            // head
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cart.productsInCart
                                                      .elementAt(index)
                                                      .nameOfProduct,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                                SizedBox(
                                                  width: 17,
                                                ),
                                                // subtitle
                                                Text(
                                                    cart.productsInCart
                                                        .elementAt(index)
                                                        .type,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    )),
                                              ],
                                            ),
                                            // trailing
                                            SizedBox(
                                              width: size.width * 0.2,
                                            ),
                                            Text(
                                                "#" +
                                                    cart.productsInCart
                                                        .elementAt(index)
                                                        .price
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  showMore
                                      ? Consumer<Cart>(
                                          builder: (context, cart, child) {
                                            int initialQuantity = cart
                                                .productsInCart
                                                .elementAt(index)
                                                .quantity;
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    cart.deleteItemFromCart(
                                                        index);
                                                    setState(() {
                                                      showMore = false;
                                                    });
                                                  },
                                                  icon: FaIcon(
                                                      FontAwesomeIcons.trash,
                                                      color: Colors.white),
                                                ),
                                                Column(
                                                  children: [
                                                    CustomNumberPicker(
                                                        customAddButton:
                                                            Container(
                                                          width: 50,
                                                          height: 50,
                                                          child: Center(
                                                            child: Icon(
                                                                Icons.add,
                                                                color: UniversalVariables
                                                                    .droPurple),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        step: 1,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: BorderSide.none,
                                                        ),
                                                        customMinusButton:
                                                            Container(
                                                          width: 50,
                                                          height: 50,
                                                          child: Center(
                                                            child: Icon(
                                                                Icons.remove,
                                                                color: UniversalVariables
                                                                    .droPurple),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        onValue: (value) {
                                                          if (value >
                                                              initialQuantity) {
                                                            initialQuantity =
                                                                value;
                                                            cart.incrementItemToCart(
                                                                index);
                                                          } else if (value <
                                                              initialQuantity) {
                                                            if (value == 0) {
                                                              setState(() {
                                                                showMore =
                                                                    false;
                                                              });
                                                            }
                                                            initialQuantity =
                                                                value;
                                                            cart.decrementItemFromCart(
                                                                index);
                                                          }
                                                        },
                                                        initialValue:
                                                            initialQuantity,
                                                        maxValue:
                                                            initialQuantity > 10
                                                                ? initialQuantity
                                                                : 10,
                                                        minValue: 0),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        )
                                      : Container(),
                                ],
                              );
                            },
                            physics: BouncingScrollPhysics(),
                          );
                        },
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18, left: 10, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                            Consumer<Cart>(
                              builder: (context, value, child) {
                                return Text("#" + value.cartSubtotal.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 55,
                          right: 55,
                        ),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return UniversalVariables.droTurquoise;
                                  return Colors.white;
                                },
                              ),
                              shape: MaterialStateProperty.resolveWith<
                                  OutlinedBorder>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20));
                                  return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20)); // Use the component's default.
                                },
                              ),
                            ),
                            onPressed: () {},
                            child: Text("      Checkout       ",
                                style: TextStyle(color: Colors.black))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundWidget: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: size * 0.04,
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text("125 items(s)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: toggleSort,
                      child: Icon(
                        Icons.sort,
                        size: 20,
                        color: Colors.black,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return UniversalVariables.grey;
                            return Colors
                                .white38; // Use the component's default.
                          },
                        ),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return CircleBorder();
                            return CircleBorder(); // Use the component's default.
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: toggleFilter,
                      child: Icon(
                        Icons.filter_alt_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return UniversalVariables.grey;
                            return Colors
                                .white38; // Use the component's default.
                          },
                        ),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return CircleBorder();
                            return CircleBorder(); // Use the component's default.
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: toggleSearch,
                      child: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return UniversalVariables.grey;
                            return Colors
                                .white38; // Use the component's default.
                          },
                        ),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return CircleBorder();
                            return CircleBorder(); // Use the component's default.
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              searchBar
                  ? Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        focusNode: searchFocusNode,
                        controller: textController,
                        onChanged: (value) {
                          setState(() {
                            onSearchTextChanged(value);
                            searchText = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(Icons.search, color: Colors.black),
                          ),
                          suffixIcon: searchText.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      searchText = "";
                                      textController.clear();
                                      _searchResult.clear();
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                  child: Icon(Icons.cancel_outlined,
                                      color: Colors.black54))
                              : null,
                          hintText: 'Enter a product name',
                          hintStyle: TextStyle(fontSize: 16),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(height: 5),
              Flexible(
                child: Container(
                  height: size.height * 0.9,
                  padding: EdgeInsets.all(10),
                  child: _searchResult.length != 0 || searchText != ""
                      ? GridView.builder(
                          padding: const EdgeInsets.only(bottom: 100),
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 220,
                            childAspectRatio: 4 / 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: _searchResult.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              measure: _searchResult.elementAt(index).measure,
                              type: _searchResult.elementAt(index).type,
                              constituent:
                                  _searchResult.elementAt(index).constituent,
                              nameOfProduct:
                                  _searchResult.elementAt(index).nameOfProduct,
                              description:
                                  _searchResult.elementAt(index).description,
                              productImage:
                                  _searchResult.elementAt(index).productImage,
                              price: _searchResult.elementAt(index).price,
                              size: size,
                              onTap: () {
                                gotoproductDetailsPage(
                                    _searchResult.elementAt(index));
                              },
                            );
                          },
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.only(bottom: 100),
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 220,
                            childAspectRatio: 4 / 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              measure: products.elementAt(index).measure,
                              type: products.elementAt(index).type,
                              constituent:
                                  products.elementAt(index).constituent,
                              nameOfProduct:
                                  products.elementAt(index).nameOfProduct,
                              description:
                                  products.elementAt(index).description,
                              productImage:
                                  products.elementAt(index).productImage,
                              price: products.elementAt(index).price,
                              size: size,
                              onTap: () {
                                gotoproductDetailsPage(
                                    products.elementAt(index));
                              },
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//  addToCart(products.elementAt(index));
  Container counterWidget() {
    return Container(
      width: 50,
      height: 50,
      child: Consumer<Cart>(
        builder: (context, cart, child) {
          return Center(
              child: Text(
            cart.countProduct.toString() ?? "0",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ));
        },
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
    );
  }
}

class ContainerTop extends StatelessWidget {
  const ContainerTop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class BagWidget extends StatelessWidget {
  const BagWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white70,
          size: 35,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Bag',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white70),
        ),
      ],
    );
  }
}
