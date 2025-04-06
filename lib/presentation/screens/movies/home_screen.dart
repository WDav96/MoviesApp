import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(dotenv.env["THE_MOVIEDB_KEY"] ?? "There is not API key..."),
      ),
    );
  }
}
