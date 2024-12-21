import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/services.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../manager/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameC;
  late TextEditingController passwordC;

  @override
  void initState() {
    super.initState();
    SafeDeviceService.checkAppVersion();
    usernameC = TextEditingController();
    passwordC = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameC.dispose();
    passwordC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print("ini screen $state");
      },
      child: Scaffold(
        body: Center(
          child: Column(
            spacing: 10.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: passwordC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _Function.loginButton(
                    context,
                    LoginParam(
                      username: usernameC.text,
                      password: passwordC.text,
                    ),
                  );
                },
                child: Text("Masuk"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Function {


  static void loginButton(BuildContext context, LoginParam params) async {
    // BlocProvider.of<AuthBloc>(context).add(LoginEvent(params));
    // final currentLocation = await LocationService.currentLocation();
    // final deviceSafe = await SafeDeviceService.checkDevice();
  }
}
