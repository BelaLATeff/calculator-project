import 'package:get/get.dart';

import '../modules/calc/bindings/calc_binding.dart';
import '../modules/calc/views/calc_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CALC;

  static final routes = [
    GetPage(
      name: _Paths.CALC,
      page: () => const CalcView(),
      binding: CalcBinding(),
    ),
  ];
}
