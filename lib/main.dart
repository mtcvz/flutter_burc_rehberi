import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'burc_detay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/burcListesi",
      routes: {
        "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> path = settings.name.split("/");
        if (path[1] == "burcDetay") {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(path[2])));
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      title: "Burc Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),

    );
  }
}
