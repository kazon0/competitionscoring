import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() => runApp(const ScoreSystemApp());

class ScoreSystemApp extends StatelessWidget {
  const ScoreSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '比赛评分系统',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const LoginPage(),
    );
  }
}
