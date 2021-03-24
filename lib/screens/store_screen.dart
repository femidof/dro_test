import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:dro_health/dummyData/products.dart';
import 'package:dro_health/index.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int added = 0;
  bool sort = false;
  bool searchBar = true;
  bool filter = true;
  String searchText = "";
  TextEditingController textController = TextEditingController();

  void toggleSearch() {
    if (searchBar == true) {
      setState(() {
        searchBar = false;
      });
    } else {
      setState(() {
        searchBar = true;
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

  @override
  Widget build(BuildContext context) {
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
                    counterWidget(text: added.toString()),
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
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BagWidget(),
                    ],
                  ),
                  Column(
                    children: [
                      counterWidget(
                        text: added.toString(),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 6, bottom: 6),
                child: Text(
                  "Tap on an item for add, remove, delete options",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),

              // Products in cart
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [],
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
              // SingleChildScrollView(child: Column()),
              searchBar
                  ? Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: textController,
                        onChanged: (value) {
                          setState(() {
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
                  child: GridView.builder(
                    padding: const EdgeInsets.only(bottom: 100),
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
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
                        constituent: products.elementAt(index).constituent,
                        nameOfProduct: products.elementAt(index).nameOfProduct,
                        description: products.elementAt(index).description,
                        productImage: products.elementAt(index).productImage,
                        price: products.elementAt(index).price,
                        size: size,
                        onTap: () {},
                        text: "Hello",
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

  Container counterWidget({String text}) {
    return Container(
      width: 50,
      height: 50,
      child: Center(
          child: Text(
        text ?? "0",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      )),
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
