import 'package:flutter/material.dart';

class StudentAppealPage extends StatelessWidget {
  const StudentAppealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('学生申诉')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            title: Text('小明 - 数学建模竞赛'),
            subtitle: Text('积分计算有误，实际应为16.0'),
            trailing: Text('待审核', style: TextStyle(color: Colors.orange)),
          ),
          ListTile(
            title: Text('小红 - 创新创业大赛'),
            subtitle: Text('获奖信息错误'),
            trailing: Text('审核通过', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
