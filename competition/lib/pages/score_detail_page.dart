import 'package:flutter/material.dart';

class ScoreDetailPage extends StatefulWidget {
  const ScoreDetailPage({super.key});

  @override
  State<ScoreDetailPage> createState() => _ScoreDetailPageState();
}

class _ScoreDetailPageState extends State<ScoreDetailPage> {
  String selectedYear = '2024–2025';
  String selectedLevel = '全部';

  final List<Map<String, String>> scoreData = [
    {
      'title': '全国大学生数学竞赛',
      'date': '2024–09–15',
      'award': '团队一等奖',
      'score': '15.0',
    },
    {
      'title': '大学生创新创业大赛',
      'date': '2024–05–05',
      'award': '二等奖',
      'score': '12.0',
    },
    {
      'title': '电子设计竞赛校选拔赛',
      'date': '2024–05–20',
      'award': '优胜奖',
      'score': '8.0',
    },
    {
      'title': '互联网挑战赛',
      'date': '2024–08–25',
      'award': '金奖',
      'score': '18.5',
    },
    {
      'title': '程序设计竞赛 ACM校赛',
      'date': '2024–11–11',
      'award': '二等奖',
      'score': '14.0',
    },
    {
      'title': '机器人竞技大赛初赛',
      'date': '2024–04–15',
      'award': '晋级奖',
      'score': '5.0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text('个人积分明细',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900,fontSize: 18)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 顶部筛选栏
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(
                  label: '学年',
                  value: selectedYear,
                  items: const ['2023–2024', '2024–2025', '2025–2026'],
                  onChanged: (value) {
                    setState(() => selectedYear = value!);
                  },
                ),
                _buildDropdown(
                  label: '赛事级别',
                  value: selectedLevel,
                  items: const ['全部', '国家级', '省级', '校级'],
                  onChanged: (value) {
                    setState(() => selectedLevel = value!);
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            _buildTableHeader(),

            Expanded(
              child: ListView.builder(
                itemCount: scoreData.length,
                itemBuilder: (context, index) {
                  final item = scoreData[index];
                  return _buildScoreRow(
                    title: item['title']!,
                    date: item['date']!,
                    award: item['award']!,
                    score: item['score']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 下拉框组件
  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Row(
      children: [
        Text('$label：', style: const TextStyle(fontSize: 15)),
        Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(fontSize: 15)),
                      ))
                  .toList(),
              onChanged: onChanged,
              icon: const Icon(Icons.arrow_drop_down, size: 20),
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }

  // 表头
  Widget _buildTableHeader() {
    return Container(
      color: Colors.grey[100],
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
              flex: 4,
              child: Text('赛事名称',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
          Expanded(
              flex: 2,
              child: Text('识别信息',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
          Expanded(
              flex: 2,
              child: Text('计算积分',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
          Expanded(
              flex: 2,
              child: Text('操作',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
        ],
      ),
    ),
    );
  }

  // 每一行积分信息
  Widget _buildScoreRow({
    required String title,
    required String date,
    required String award,
    required String score,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE0E0E0)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(date, style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500)),
                Text(award,
                    style: const TextStyle(
                        fontSize: 11,fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(score,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('查看',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange[600],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('申诉',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
