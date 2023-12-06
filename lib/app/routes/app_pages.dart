import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/trace/bindings/trace_binding.dart';
import '../modules/trace/views/trace_view.dart';
import '../modules/truck/bindings/truck_binding.dart';
import '../modules/truck/views/truck_view.dart';
import '../modules/truck_trace/bindings/truck_trace_binding.dart';
import '../modules/truck_trace/bindings/truck_trace_binding.dart';
import '../modules/truck_trace/views/truck_trace_view.dart';
import '../modules/truck_trace/views/truck_trace_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.TRUCK,
      page: () => const TruckView(),
      binding: TruckBinding(),
    ),
    GetPage(
      name: _Paths.TRACE,
      page: () => const TraceView(),
      binding: TraceBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.TRUCK_TRACE,
      page: () => const TruckTraceView(),
      binding: TruckTraceBinding(),
      children: [
        GetPage(
          name: _Paths.TRUCK_TRACE,
          page: () => const TruckTraceView(),
          binding: TruckTraceBinding(),
        ),
      ],
    ),
  ];
}
