import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'theme/neo_theme.dart';

void main() {
  runApp(const Pert1App());
}

class Pert1App extends StatelessWidget {
  const Pert1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pert1 - Login',
      debugShowCheckedModeBanner: false,
      theme: buildNeoTheme(),
      home: const LoginPage(),
    );
  }
}
