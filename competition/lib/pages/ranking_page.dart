import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'name': '小明', 'score': 72.5},
      {'name': '小红', 'score': 68.0},
      {'name': '小刚', 'score': 59.5},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('积分排名')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(item['name'].toString()),
              trailing: Text(item['score'].toString()),
            ),
          );
        },
      ),
    );
  }
}
