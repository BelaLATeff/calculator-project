import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcController extends GetxController {
  String result = "0";
  String input = "";
  List<String> buttonsList = [
    "C",
    "(",
    ")",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "+",
    "3",
    "2",
    "1",
    "-",
    "AC",
    "0",
    ".",
    "=",
  ];

  @override
  void onInit() {
    super.onInit();
  }

  Color getColor(String text) {
    if (text == "/" || text == "*" || text == "+" || text == "-") {
      return Colors.orange;
    }
    if (text == "C" || text == "AC") {
      return Colors.green;
    }
    if (text == "(" || text == ")") {
      return Colors.blueGrey;
    }
    if (text == "=") {
      return Colors.red;
    }
    return Colors.blue;
  }

  handleButtonPress(String text) {
    if (text == "AC") {
      input = "";
      result = "0";
      update();
      return;
    }
    if (text == "C") {
      input = input.substring(0, input.length - 1);
      update();
      return;
    }
    if (text == "=") {
      result = operations();
      if (result.endsWith(".0")) {
        result = result.replaceAll(".0", "");
      }
      update();
      return;
    }
    input = input + text;
    update();
  }

  String operations() {
    try {
      var exp = Parser().parse(input);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
}
