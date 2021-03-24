import 'package:dro_health/index.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    @required this.size,
    @required this.onTap,
    @required this.productImage,
    @required this.price,
    @required this.constituent,
    @required this.description,
    @required this.nameOfProduct,
    @required this.type,
    @required this.measure,
  });

  final String productImage;
  final String nameOfProduct;
  final String description;
  final int price;
  final List constituent;
  final Size size;
  final Function onTap;
  final String type;
  final String measure;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.30,
      width: widget.size.width * 0.90,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: NetworkImage(
                        widget.productImage,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.nameOfProduct,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.description,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: UniversalVariables.grey,
                                ),
                              ),
                              Text(
                                widget.type + "-" + widget.measure,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: UniversalVariables.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 14,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: UniversalVariables.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 3.0, bottom: 3, left: 10, right: 10),
                          child: Text(
                            "#" + widget.price.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
