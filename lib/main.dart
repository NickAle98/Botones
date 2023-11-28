import 'package:flutter/material.dart';

//import 'package:hello_world_app/presentation/screens/Counters/counter_screen.dart';

import 'package:hello_world_app/presentation/screens/Counters/page_colors.dart';

var page = PageColors();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
        debugShowCheckedModeBanner:
            false, // QUITAS LA ETIQUETA DE LA ESQUINA IZQUIERDA
        theme: ThemeData(),
        home: page);
    return materialApp;
  }
}
