import 'package:edoc/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text("Login"),
        const CupertinoTextField(
          placeholder: 'Enter email',
        ),
        const CupertinoTextField(
          placeholder: 'Enter password',
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MainApp()));
            },
            child: const Text("Login"))
      ],
    ));
  }
}
