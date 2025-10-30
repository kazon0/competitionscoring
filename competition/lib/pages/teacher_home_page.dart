import 'package:flutter/material.dart';
import 'ranking_page.dart';
import 'student_appeal_page.dart';
import 'login_page.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人主页'), automaticallyImplyLeading: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('辅导员'),
              subtitle: const Text('账号：00076'),
            ),
          ),
          const SizedBox(height: 10),
          _buildMenu(context, Icons.leaderboard, '积分排名', const RankingPage()),
          _buildMenu(context, Icons.assignment, '学生申诉', const StudentAppealPage()),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            ),
            child: const Text('退出登录'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, IconData icon, String title, Widget page) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      ),
    );
  }
}
