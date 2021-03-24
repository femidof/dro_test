import 'package:dro_health/index.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail({this.product});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
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
            onPressed: () {},
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.white60,
            ),
            label: Text(
              "Add To Bag",
            )),
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white60,
                  ),
                  label: Text("3")),
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
              height: size.height * 0.3,
              width: size.width * 0.4,
              child: Image(
                image: NetworkImage(widget.product.productImage),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(widget.product.nameOfProduct),
          Text(widget.product.type + "-" + widget.product.measure),
          SizedBox(
            height: 13,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.product.sellerImage),
                backgroundColor: UniversalVariables.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
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
          Row(
            children: [
              CustomNumberPicker(
                initialValue: 1,
                maxValue: 10,
                minValue: 1,
                step: 1,
                onValue: (value) {
                  print(value.toString());
                },
              ),
              Text("Pack(s)"),
              SizedBox(
                width: size.width * 0.55,
              ),
              Text(widget.product.price.toString()),
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            "PRODUCT DETAILS",
          ),
          Row(
            children: [
              Column(),
              Column(),
            ],
          ),
          Row(),
          Row(),
          SizedBox(
            height: 20,
          ),
          Text("1" +
              " of " +
              widget.product.nameOfProduct +
              " contains 3 units of 10 tablets ")
        ],
      )),
    );
  }
}
