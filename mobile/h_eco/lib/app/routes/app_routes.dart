import 'package:go_router/go_router.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/sign_in/sign_in_screen.dart';
import '../../screens/profile/profile_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String signIn = '/sign-in';
  static const String profile = '/profile';
  
  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const ProfileScreen(),
      )
    ]
  );
}