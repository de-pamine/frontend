import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              "Depamine",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: 300,
            height: 60,
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: 300,
            height: 60,
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
