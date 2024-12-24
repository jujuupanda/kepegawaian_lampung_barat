import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/services.dart';
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
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                spacing: 10.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(50.h),
                  Text("Save Data"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 4.w,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await SecureStorageHelper.write(
                              key: "username",
                              value: "julio",
                            );
                            await SecureStorageHelper.write(
                              key: "password",
                              value: "1234",
                            );
                          },
                          child: Text("Create"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final a = await SecureStorageHelper.read(
                                key: "username");
                            print(a);
                          },
                          child: Text("Read"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final a = await SecureStorageHelper.readAll();
                            print(a);
                          },
                          child: Text("Read All"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await SecureStorageHelper.delete(
                                key: "password");
                          },
                          child: Text("Delete"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await SecureStorageHelper.deleteAll();
                          },
                          child: Text("DeleteAll"),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Ini Header LOGIN",
                    style: TextStyleHelper.header2(),
                  ),
                  CommonWidget.textFormField(
                      controller: usernameC,
                      identifiedPage: "login_page",
                      identifiedAs: "email",
                      hint: "Email",
                      prefixIcon: IconButtonModel(iconData: Icons.email)),
                  CommonWidget.textFormField(
                      controller: passwordC,
                      identifiedPage: "login_page",
                      identifiedAs: "password",
                      hint: "Password",
                      prefixIcon: IconButtonModel(iconData: Icons.lock)),
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Text(state.toString());
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await LocationHelper.locationChecker("primary");
                    },
                    child: Text("Location Checker"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await NotificationService.showNotification();
                    },
                    child: Text("Notification"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await NotificationService.scheduleNotification();
                    },
                    child: Text("Notification Schedule"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await CameraHelper.openCamera();
                    },
                    child: Text("Open Camera"),
                  ),
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
          DialogContentModel(
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
