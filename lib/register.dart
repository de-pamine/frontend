import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  "회원가입",
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
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    hintText: "비밀번호 확인",
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    hintText: "닉네임",
                  ),
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
