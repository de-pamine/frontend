import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 60,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    hintText: "이메일",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    hintText: "비밀번호",
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    context.go("/register");
                  },
                  child: const Text(
                    "회원가입",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
