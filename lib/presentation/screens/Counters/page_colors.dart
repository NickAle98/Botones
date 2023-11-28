import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_app/presentation/screens/Counters/numeros.dart';
import 'package:hello_world_app/widgets/buttons.dart';

import 'package:audioplayers/audioplayers.dart';

//import 'package:hello_world_app/presentation/screens/Counters/numeros.dart';

class PageColors extends StatefulWidget {
  const PageColors({super.key});

  @override
  State<PageColors> createState() => _PageColorsState();
}

bool isVisible = false;
Color colores = Colors.white;
Color textColor = Colors.black;
String textVis = "";
double tamText = 10.0;
int selectIndex = 0;

class _PageColorsState extends State<PageColors> {
  btnRed() async {
    final player = AudioPlayer(); // Crea un reproductor
    try {
      await player.setSourceAsset('assets/sonido.mp3');
      await player.play(UrlSource(
          'https://www.elongsound.com/images/mp3/amanecerconpajarosenlaciudad_01.mp3'));
      setState(() {
        isVisible = !isVisible;
        colores = Colors.red;
        textVis = "ROJO";
        tamText = 190.0;
        textColor = Colors.white;
      });
    } catch (e) {
      print('Error al cargar o reproducir el archivo de audio: $e');
      // Manejar el error de carga o reproducción del archivo de audio desde la URL
    } finally {
      // Asegúrate de liberar el recurso del reproductor cuando ya no sea necesario
      player.dispose();
    }
  }

  btnYellow() {
    setState(() {
      isVisible = !isVisible;
      colores = Colors.yellow;
      textVis = "AMARILLO";
      textColor = Colors.white;
      tamText = 180.0;
    });
  }

  btnOrange() {
    setState(() {
      isVisible = !isVisible;
      colores = Colors.orange;
      textVis = "NARANJA";
      textColor = Colors.white;
      tamText = 190.0;
    });
  }

  btnBlue() {
    setState(() {
      isVisible = !isVisible;
      colores = Colors.blue;
      textVis = "AZUL";
      tamText = 190.0;
      textColor = Colors.white;
    });
  }

  btnPurple() {
    setState(() {
      isVisible = !isVisible;
      colores = Colors.purple;
      textVis = "MORADO";
      tamText = 190.0;
      textColor = Colors.white;
    });
  }

  btnGreen() {
    setState(() {
      isVisible = !isVisible;
      colores = Colors.green;
      textVis = "VERDE";
      tamText = 190.0;
      textColor = Colors.white;
    });
  }

  changePage() {
    if (selectIndex == 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const Numbers())); //cambiar de pagina
    }
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
          foregroundColor: textColor,
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
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              alignment: Alignment.center,
              width: double.infinity,
              height: 839,
              child: Table(children: [
                TableRow(children: [
                  ButtonColorRed(
                    onPressed: btnRed,
                    backgroundColor: Colors.red,
                    textButton: 'ROJO',
                  ),
                  ButtonColorRed(
                    onPressed: btnYellow,
                    backgroundColor: Colors.yellow,
                    textButton: 'AMARILLO',
                  ),
                  ButtonColorRed(
                    onPressed: btnOrange,
                    backgroundColor: Colors.orange,
                    textButton: 'NARANJA',
                  ),
                ]),
                TableRow(children: [
                  ButtonColorRed(
                    onPressed: btnBlue,
                    backgroundColor: Colors.blue,
                    textButton: 'AZUL',
                  ),
                  ButtonColorRed(
                    onPressed: btnPurple,
                    backgroundColor: Colors.purple,
                    textButton: 'MORADO',
                  ),
                  ButtonColorRed(
                    onPressed: btnGreen,
                    backgroundColor: Colors.green,
                    textButton: 'VERDE',
                  ),
                ])
              ]),
            ),
            Visibility(
                visible: isVisible,
                child: VisButton(
                  onPressed: () => setState(() {
                    isVisible = !isVisible;
                  }),
                ))
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: textColor,
          selectedFontSize: 20.0,
          unselectedItemColor: textColor,
          currentIndex: selectIndex,
          backgroundColor: colores,
          onTap: (value) {
            setState(() {
              if (isVisible = true) {
                isVisible = !isVisible;
              }
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
            ),
          ],
        ));
  }
}
