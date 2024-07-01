import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationButtonGrid extends StatefulWidget {
  const NavigationButtonGrid({
    super.key,
  });

  @override
  State<NavigationButtonGrid> createState() => _NavigationButtonGridState();
}

class _NavigationButtonGridState extends State<NavigationButtonGrid> with TickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation3;

  void tmpOpenFunc() {
    if (_isOpen) {
      _controller.reverse().then((_) {
        setState(() {
          _isOpen = false;
        });
      });
    } else {
      setState(() {
        _isOpen = true;
      });
      _controller.forward();
    }
    context.go("/");
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 360),
      vsync: this,
    );

    _fadeAnimation = CurveTween(curve: Curves.easeInOutCirc).animate(_controller);
    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(-0.35, 0.0),
      end: const Offset(0, 0.0),
    ).animate(_controller);
    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0.0, -0.35),
      end: const Offset(0, 0.0),
    ).animate(_controller);
    _slideAnimation3 = Tween<Offset>(
      begin: const Offset(-0.35, -0.35),
      end: const Offset(0, 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displaySize = MediaQuery.of(context).size;
    return SizedBox(
      width: displaySize.width * 0.2,
      height: displaySize.height * 0.2,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          GestureDetector(
            onTap: tmpOpenFunc,
            child: const Icon(
              Icons.widgets_rounded, //background_dot_large
              color: Colors.white,
              size: 32,
              shadows: <Shadow>[
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
          ),
          if (_isOpen) ...[
            NavigationButton(
              slideAnimation: _slideAnimation1,
              fadeAnimation: _fadeAnimation,
              icon: Icons.square,
              onTap: () {
                context.go("/login");
              },
            ),
            NavigationButton(
              slideAnimation: _slideAnimation2,
              fadeAnimation: _fadeAnimation,
              icon: Icons.star,
              onTap: () {},
            ),
            NavigationButton(
              slideAnimation: _slideAnimation3,
              fadeAnimation: _fadeAnimation,
              icon: Icons.star_border,
              onTap: () {},
            ),
          ]
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
    required this.slideAnimation,
    required this.fadeAnimation,
  });
  final IconData icon;
  final void Function() onTap;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: GestureDetector(
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
        ),
      ),
    );
  }
}
