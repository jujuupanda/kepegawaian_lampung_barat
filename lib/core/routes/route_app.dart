import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/attendance/presentation/pages/attendance_screen.dart';
import '../../features/history/presentation/pages/history_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/navigation_bar/presentation/pages/bottom_navigation_bar.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/service/presentation/pages/service_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';

part 'route_name.dart';

final GlobalKey<NavigatorState> _navigatorHome = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _navigatorService = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _navigatorAttendance =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _navigatorHistory = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _navigatorProfile = GlobalKey<NavigatorState>();

final GoRouter routerApp = GoRouter(
  routes: <RouteBase>[
    /// Route without parent
    GoRoute(
      path: '/',
      name: RouteName.splashScreen,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/loginScreen',
      name: RouteName.loginScreen,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),

    /// Route with parent
    /// if have many role in app, just add more StatefulShellRoute.indexedStack
    /// with different name and path name
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MyNavigationBar(
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _navigatorHome,
          routes: [
            GoRoute(
              path: "/homeScreen",
              name: RouteName.homeScreen,
              builder: (context, state) {
                return const HomeScreen();
              },
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _navigatorService,
          routes: [
            GoRoute(
              path: "/serviceScreen",
              name: RouteName.serviceScreen,
              builder: (context, state) {
                return const ServiceScreen();
              },
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _navigatorAttendance,
          routes: [
            GoRoute(
              path: "/attendanceScreen",
              name: RouteName.attendanceScreen,
              builder: (context, state) {
                return const AttendanceScreen();
              },
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _navigatorHistory,
          routes: [
            GoRoute(
              path: "/historyScreen",
              name: RouteName.historyScreen,
              builder: (context, state) {
                return const HistoryScreen();
              },
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _navigatorProfile,
          routes: [
            GoRoute(
              path: "/profileScreen",
              name: RouteName.profileScreen,
              builder: (context, state) {
                return const ProfileScreen();
              },
            )
          ],
        ),
      ],
    ),
  ],
);
