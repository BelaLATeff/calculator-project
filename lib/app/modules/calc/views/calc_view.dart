import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/calc_controller.dart';

class CalcView extends GetView<CalcController> {
  const CalcView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('CalcView'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: resultWidegt(),
            ),
            Flexible(
              flex: 2,
              child: buttonsWidegt(),
            ),
          ],
        ),
      ),
    );
  }

  Widget resultWidegt() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: GetBuilder<CalcController>(
            builder: (_) => Text(
              controller.input,
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: GetBuilder<CalcController>(
            builder: (_) => Text(
              controller.result,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonsWidegt() {
    return GridView.builder(
        itemCount: controller.buttonsList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return button(controller.buttonsList[index]);
        });
  }

  Widget button(String text) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          controller.handleButtonPress(text);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: controller.getColor(text),
            shape: const CircleBorder()),
        child: Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
