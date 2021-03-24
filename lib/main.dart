import 'package:dro_health/models/cart.dart';

import 'index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        title: 'DRO HEALTH',
        theme: ThemeData(
          fontFamily: "Proxima Nova",
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: RootApp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Moves to the Store Screen
    void navigateToStoreScreen() {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return StoreScreen();
        },
      ));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.store_mall_directory_outlined),
          onPressed: navigateToStoreScreen,
          label: Text("Enter Store"),
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24));
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        24)); // Use the component's default.
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return UniversalVariables.droTurquoise;
                return UniversalVariables
                    .droPurple; // Use the component's default.
              },
            ),
          ),
        ),
      ),
    );
  }
}
