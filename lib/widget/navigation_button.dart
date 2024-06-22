import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
