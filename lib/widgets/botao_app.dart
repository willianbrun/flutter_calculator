import 'package:flutter/material.dart';

class BotaoApp extends StatelessWidget {
  String titulo;
  Function() onPressed;

  BotaoApp({Key? key, required this.titulo, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: const Size(240, 70),
        ),
        child: Text(
          titulo,
          style: const TextStyle(
            fontSize: 30,
          ),
        ));
  }
}
