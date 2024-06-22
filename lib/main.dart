import 'package:depamine/login.dart';
import 'package:depamine/register.dart';
import 'package:depamine/view/home_screen.dart';
import 'package:depamine/widget/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
      ],
    );
  }

  final GoRouter _router = GoRouter(
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
    );
  }
}

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
