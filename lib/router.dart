/*

import 'package:depamine/login.dart';
import 'package:depamine/main.dart';
import 'package:depamine/register.dart';
import 'package:depamine/view/home_screen.dart';
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

*/