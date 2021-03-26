import 'package:dro_health/index.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail({this.product});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity;

  @override
  void initState() {
    super.initState();
    quantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Consumer<Cart>(
          builder: (context, value, child) {
            return ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return UniversalVariables.darkPurple;
                      return UniversalVariables.droPurple;
                    },
                  ),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14));
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14));
                    },
                  ),
                ),
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    customHeader: Container(
                        decoration: BoxDecoration(
                          color: UniversalVariables.droTurquoise,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.check,
                            size: 70,
                            color: Colors.white,
                          ),
                        )),
                    body: Column(
                      children: [
                        Text(
                          "Successful",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.product.nameOfProduct +
                                " has been added to your bag",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed))
                                        return UniversalVariables.grey;
                                      return UniversalVariables.droTurquoise;
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "View Bag",
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed))
                                        return UniversalVariables.grey;
                                      return UniversalVariables
                                          .droTurquoise; // Use the component's default.
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Done",
                                )),
                          ),
                        ),
                      ],
                    ),
                  )..show();
                  value.addToCart(
                      product: widget.product,
                      productId: widget.product.productId,
                      unitPrice: widget.product.price,
                      quantity: quantity);
                },
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white60,
                ),
                label: Text(
                  "Add To Bag",
                ));
          },
        ),
      ),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: size * 0.06,
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return UniversalVariables.darkPurple;
                        return UniversalVariables
                            .droPurple; // Use the component's default.
                      },
                    ),
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14));
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                14)); // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: null,
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white60,
                  ),
                  label: Consumer<Cart>(
                    builder: (context, value, child) {
                      return Text(
                        value.countProduct.toString(),
                        style: TextStyle(color: Colors.white60),
                      );
                    },
                  )),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 7,
          ),
          Center(
            child: SizedBox(
              height: size.height * 0.25,
              width: size.width * 0.4,
              child: Image(
                image: NetworkImage(widget.product.productImage),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              widget.product.nameOfProduct,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              widget.product.type + "-" + widget.product.measure,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.product.sellerImage),
                  backgroundColor: UniversalVariables.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sold By",
                    ),
                    Text(
                      widget.product.seller,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                CustomNumberPicker(
                  initialValue: 1,
                  maxValue: 10,
                  minValue: 1,
                  step: 1,
                  onValue: (value) {
                    quantity = value;
                  },
                ),
                Text(
                  "Pack(s)",
                  style: TextStyle(color: UniversalVariables.grey),
                ),
                SizedBox(
                  width: size.width * 0.45,
                ),
                Text("#" + (widget.product.price).toString()),
              ],
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 26,
              bottom: 10,
            ),
            child: Text(
              "PRODUCT DETAILS",
              style: TextStyle(color: UniversalVariables.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.capsules,
                    color: UniversalVariables.droPurple),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pack Size".toUpperCase(),
                        style: TextStyle(color: UniversalVariables.grey)),
                    Text(widget.product.packSize,
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.25,
                ),
                Icon(
                  Icons.qr_code_scanner_outlined,
                  color: UniversalVariables.droPurple,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product ID".toUpperCase(),
                        style: TextStyle(color: UniversalVariables.grey)),
                    Text(widget.product.productId.toUpperCase(),
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 20),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.tablets,
                    color: UniversalVariables.droPurple),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CONSISTUENTS".toUpperCase(),
                        style: TextStyle(color: UniversalVariables.grey)),
                    Text(
                        widget.product.constituent
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", "")
                            .replaceAll(",", " ")
                            .toLowerCase(),
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 20),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.prescriptionBottle,
                    color: UniversalVariables.droPurple),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dispensed In".toUpperCase(),
                        style: TextStyle(color: UniversalVariables.grey)),
                    Text(widget.product.dispenseIn,
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                "1" +
                    " of " +
                    widget.product.nameOfProduct +
                    " contains ${widget.product.unitPackSize.toString()} units of ${widget.product.packSizeComplete.toString()} tablets ",
                style: TextStyle(color: UniversalVariables.grey),
              ),
            ),
          )
        ],
      )),
    );
  }
}
