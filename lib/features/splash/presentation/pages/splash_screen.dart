import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routes/route_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> splashTime() async {
    Future.delayed(
      const Duration(seconds: 1, microseconds: 500),
      () {
        /// TODO: BLoC is login checker
        if (mounted) GoRouter.of(context).goNamed(RouteName.loginScreen);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    splashTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SPLASH SCREEN",
              style: GoogleFonts.openSans(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
