import 'package:flutter/material.dart';

class ScoreDetailPage extends StatelessWidget {
  const ScoreDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人积分明细')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: '学年'),
                  value: '2024-2025',
                  items: const [
                    DropdownMenuItem(value: '2024-2025', child: Text('2024-2025')),
                  ],
                  onChanged: (_) {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: '赛事级别'),
                  value: '全部',
                  items: const [
                    DropdownMenuItem(value: '全部', child: Text('全部')),
                  ],
                  onChanged: (_) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildRow('全国大学生数学竞赛', '团队一等奖', '15.0', context),
          _buildRow('大学生创新创业大赛', '二等奖', '12.0', context),
          _buildRow('电子设计竞赛', '优胜奖', '8.0', context),
        ],
      ),
    );
  }

  Widget _buildRow(String name, String info, String score, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(info),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(score, style: const TextStyle(color: Colors.green)),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => _showAppealDialog(context),
              child: const Text('申诉'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAppealDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('申诉申请'),
        content: const TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: '请描述积分疑问或错误…',
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('提交申诉')),
        ],
      ),
    );
  }
}
