import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/login/presentation/manager/auth_bloc.dart';
import 'service_locator.dart';

import 'app.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MyApp(),
    ),
  );
  serviceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: const App(),
      ),
    );
  }
}
