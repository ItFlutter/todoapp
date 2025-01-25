import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/view/theme/controller/theme_controller.dart';
import 'package:to_do_app/core/sevices/sevices.dart';
import 'bindings/initial_bindings.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.put(ThemeController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((_, child) => GetMaterialApp(
            // darkTheme: ThemeData.dark(),
            initialBinding: InitialBindings(),
            debugShowCheckedModeBanner: false,
            getPages: routes,
            theme: controller.appTheme,
            themeMode: ThemeMode.light,
          )),
    );
  }
}
