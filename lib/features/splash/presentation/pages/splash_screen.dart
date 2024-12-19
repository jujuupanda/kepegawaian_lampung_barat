import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../login/data/data_sources/auth_data_source.dart';
import '../../../login/domain/use_cases/login_use_case.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// TODO: ini nantinya harus menampilkan peringatan jika tidak sama versinya
  Future<void> checkAppVersion() async {
    final appInfo = await PackageInfo.fromPlatform();
    if (appInfo.version == "1.0.0") {
      print("Tidak perlu diperbarui");
    } else {
      print("Harus diperbarui");
    }
  }

  @override
  void initState() {
    super.initState();
    checkAppVersion();
  }

  final params = const LoginParam(
    username: "eve.holt@reqres.in",
    password: "cityslicka",
  );

  login() {
    return () {
      AuthRemoteDataSource().login(params);
    };
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
            const Gap(10),
            Container(
              height: 40,
              width: 140,
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: login(),
                  splashColor: Colors.grey,
                  child: const Center(
                    child: Text("Login"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
