import 'package:depamine/animation.dart';
import 'package:depamine/login.dart';
import 'package:depamine/register.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          color: Colors.lightBlue.shade50,
          child: const AnimationWidget(),
        ),
      ],
    );
  }
}

class NavigationButtonGrid extends StatefulWidget {
  const NavigationButtonGrid({
    super.key,
  });

  @override
  State<NavigationButtonGrid> createState() => _NavigationButtonGridState();
}

class _NavigationButtonGridState extends State<NavigationButtonGrid> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 84,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          NavigationButton(
            icon: Icons.home_filled,
            onTap: () {
              context.go("/");
            },
          ),
          NavigationButton(
            icon: Icons.square,
            onTap: () {
              context.go("/login");
            },
          ),
          NavigationButton(
            icon: Icons.star,
            onTap: () {},
          ),
          NavigationButton(
            icon: Icons.star,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon, //background_dot_large
        color: Colors.white,
        size: 32,
        shadows: const <Shadow>[
          Shadow(
            color: Colors.black45,
            blurRadius: 20.0,
            offset: Offset(
              0,
              2.0,
            ),
          ),
        ],
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
