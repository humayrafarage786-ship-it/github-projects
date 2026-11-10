import 'package:go_router/go_router.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/sign_in/sign_in_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/history/history_screen.dart';
import '../../screens/main_layout.dart';

class AppRoutes {
  static const String home = '/home';
  static const String signIn = '/sign-in';
  static const String profile = '/profile';
  static const String history = '/history';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: signIn, builder: (context, state) => const SignInScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },

        branches: [
          // home
          StatefulShellBranch(
            routes: [
              GoRoute(path: home, builder: (context, state) => HomeScreen()),
            ],
          ),
          // history
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: history,
                builder: (context, state) => HistoryScreen(),
              ),
            ],
          ),
          // profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: profile,
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
