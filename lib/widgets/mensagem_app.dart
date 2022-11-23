import 'package:flutter/material.dart';

MensagemApp(
  BuildContext context,
  String titulo,
  Color corBackground,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(titulo),
    backgroundColor: corBackground,
    duration: const Duration(
      seconds: 3,
    ),
  ));
}
