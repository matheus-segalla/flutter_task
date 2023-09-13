import 'package:flutter/material.dart';

import 'RegisterScreen.dart';
import 'login_page.dart';

class LoginOrREgister extends StatefulWidget {
  const LoginOrREgister({super.key});

  @override
  State<LoginOrREgister> createState() => _LoginOrREgisterState();
}

class _LoginOrREgisterState extends State<LoginOrREgister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterScreen(onTap: togglePages);
    };
  }
}