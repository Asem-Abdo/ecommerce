import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/features/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di/di.dart';
import 'config/my_bloc_observer.dart';
import 'core/utils/app_theme.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),

          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
