import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
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
    _Function.isAppLatest(context);
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
      listener: (context, state) {},
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: Column(
                spacing: 10.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ini Header LOGIN",
                    style: TextStyleHelper.header1(),
                  ),
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
                  ),
                  CommonWidget.baseFormField(
                    controller: TextEditingController(),
                    identifiedPage: "login_page",
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Text(state.toString());
                    },
                  )
                ],
              ),
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return CommonWidget.loadingWaveDots(context);
              } else {
                return CommonWidget.emptyWidget();
              }
            },
          )
        ],
      ),
    );
  }
}

class _Function {
  static void isAppLatest(BuildContext context) async {
    if (await AppDeviceHelper.isAppLatest() == false) {
      if (context.mounted) {
        CommonWidget.dialogBox(
          context,
          DialogModel(
            title: "Aplikasi kadaluarsa",
            content:
                "Terdapat aplikasi versi terbaru. Silahkan update aplikasi ke versi terbaru.",
          ),
        );
      }
    }
  }

  static void loginButton(BuildContext context, LoginParam params) async {
    if (await AppDeviceHelper.isDeviceSafe()) {
      if (context.mounted) {
        BlocProvider.of<AuthBloc>(context).add(LoginEvent(params));
      }
    } else {
      if (context.mounted) {
        CommonWidget.secureWarning(context);
      }
    }
    // BlocProvider.of<AuthBloc>(context).add(LoginEvent(params));
    // final currentLocation = await LocationService.currentLocation();
    // final deviceSafe = await SafeDeviceService.checkDevice();
  }
}
