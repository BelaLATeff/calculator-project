import 'package:calcatuor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Calcoltur",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
