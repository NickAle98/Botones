import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_app/presentation/screens/Counters/page_colors.dart';
import 'package:hello_world_app/widgets/buttons.dart';

//import 'package:hello_world_app/presentation/screens/Counters/numeros.dart';
void changedVis() {
  isVisible = !isVisible;
}

class Numbers extends StatefulWidget {
  const Numbers({super.key});

  @override
  State<Numbers> createState() => _NumbersState();
}

int num = 1;
Color barsColorText = Colors.black;

class _NumbersState extends State<Numbers> {
  changePage() {
    if (selectIndex == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const PageColors()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]); //esto es para poder hacer que la patnalla solo sea horizontal.
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colores,
          foregroundColor: barsColorText,
          title: const Text(
              '|--------------------TOCA LOS BOTONES--------------------|'),
          centerTitle: true,
        ),
        body: Center(
            child: Stack(alignment: Alignment.center, children: [
          Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF92d6ff),
                  borderRadius: BorderRadius.circular(50.0)),
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              width: double.infinity,
              height: 839,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(fixedSize: const Size(200, 200)),
                onPressed: () {
                  setState(() {
                    num++;
                    if (num == 11) {
                      num = 1;
                    }
                    tamText = 200.0;
                    colores = Colors.blue;
                    textVis = num.toString();
                    changedVis();
                    barsColorText = Colors.white;
                  });
                },
                child: Text(num.toString(),
                    style: const TextStyle(
                      fontSize: 200.0,
                    ),
                    textAlign: TextAlign.center),
              )),
          Visibility(
              visible: isVisible,
              child: VisButton(onPressed: () {
                setState(() {
                  isVisible = !isVisible;

                  barsColorText = Colors.black;
                  colores = Colors.white;
                });
              }))
        ])),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: barsColorText,
            selectedFontSize: 20.0,
            unselectedItemColor: barsColorText,
            currentIndex: selectIndex,
            backgroundColor: colores,
            onTap: (value) {
              setState(() {
                if (isVisible = true) {
                  isVisible = !isVisible;
                }
                num = 1;
                selectIndex = value;
                changePage();
                colores = Colors.white;
                textColor = Colors.black;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.onetwothree_sharp),
                activeIcon: Icon(Icons.onetwothree_sharp),
                label: 'COLORES',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.brightness_1),
                  activeIcon: Icon(Icons.brightness_1),
                  label: 'NUMEROS'),
              BottomNavigationBarItem(
                icon: Icon(Icons.brightness_1),
                activeIcon: Icon(Icons.brightness_1),
                label: 'ANIMALES',
              )
            ]));
  }
}
