import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/Counters/page_colors.dart';
import 'package:hello_world_app/presentation/screens/Counters/numeros.dart';

class ButtonColorRed extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String textButton;

  const ButtonColorRed(
      {required this.onPressed,
      required this.backgroundColor,
      required this.textButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Usa la función proporcionada desde main.dart
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: const Size(200, 100),
      ),
      child: Text(
        textButton,
        style: const TextStyle(fontSize: 50.0),
      ),
    );
  }
}

//-------------------------------------------------------------------------------------------------------------------------
class VisButton extends StatelessWidget {
  final VoidCallback onPressed;
  const VisButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: colores, fixedSize: const Size(900, 250)),
        child: Text(
          textVis,
          style: TextStyle(
            fontSize: tamText,
          ),
          textAlign: TextAlign.center,
        ));
  }
}




//-------------------------------------------------------------------------------------------------
