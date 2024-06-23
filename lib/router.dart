import 'package:depamine/view/login_screen.dart';
import 'package:depamine/view/register_screen.dart';
import 'package:depamine/view/home_screen.dart';
import 'package:depamine/widget/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: "/",
  routes: [
    // GoRoute(
    //   path: "/",
    //   pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
    // ),
    //start
    ShellRoute(
      navigatorKey: shellNavKey,
      routes: [
        GoRoute(
          path: "/",
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          ),
        ),
        GoRoute(
          path: "/login",
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const LoginScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          ),
        ),
        GoRoute(
          path: "/register",
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const RegisterScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          ),
        ),
      ],
      builder: (context, state, child) => Shell(child: child),
    ),
  ],
);

class Shell extends StatelessWidget {
  const Shell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          const Positioned(
            left: 20,
            top: 20,
            child: NavigationButtonGrid(),
          ),
        ],
      ),
    );
  }
}
