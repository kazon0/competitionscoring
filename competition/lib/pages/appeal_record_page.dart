import 'package:flutter/material.dart';

class AppealRecordPage extends StatelessWidget {
  const AppealRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('申诉记录')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard('全国大学生数学建模竞赛', '待审核', Colors.orange),
          _buildCard('大学生创新创业大赛', '审核通过', Colors.green),
          _buildCard('电子设计竞赛选拔赛', '审核驳回', Colors.red),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String status, Color color) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text('申诉内容：积分有误等'),
        trailing: Text(status, style: TextStyle(color: color)),
      ),
    );
  }
}
