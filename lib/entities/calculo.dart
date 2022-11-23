import 'package:flutter/material.dart';

class Calculo {
  double? input1;
  double? input2;
  int? operation;
  IconData? icon;
  double? result;
  String? formula;

  /* CONVENÇÃO:
  0 - Somar
  1 - Subtrair
  2 - Muliplicar
  3 - Dividir
  */

  void calculate() {
    switch (operation) {
      case 0:
        formula = "{input1.toString()} + {input2.toString()}";
        result = input1! + input2!;
        icon = Icons.add;
        break;

      case 1:
        formula = "{input1.toString()} - {input2.toString()}";
        result = input1! - input2!;
        icon = Icons.remove_sharp;
        break;

      case 2:
        formula = "{input1.toString()} * {input2.toString()}";
        result = input1! * input2!;
        icon = Icons.add;
        break;

      case 3:
        formula = "{input1.toString()} / {input2.toString()}";
        result = input1! / input2!;
        icon = Icons.add;
        break;
    }
  }
}
