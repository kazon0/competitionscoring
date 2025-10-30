import 'package:flutter/material.dart';

class AppealRecordPage extends StatefulWidget {
  const AppealRecordPage({super.key});

  @override
  State<AppealRecordPage> createState() => _AppealRecordPageState();
}

class _AppealRecordPageState extends State<AppealRecordPage> {
  String selectedYear = '2024–2025';
  String selectedLevel = '全部';

  final List<Map<String, dynamic>> appeals = [
    {
      'title': '全国大学生数学建模竞赛',
      'appealTime': '2024–09–16',
      'identifyInfo': '2024–09–15 团队一等奖',
      'content': '积分计算有误，实际应为16.0',
      'status': '待审核',
      'color': Colors.orange
    },
    {
      'title': '大学生创新创业大赛',
      'appealTime': '2024–07–11',
      'identifyInfo': '2024–07–10 二等奖',
      'content': '赛事信息错误，团队成员信息有误',
      'status': '审核通过',
      'color': Colors.green
    },
    {
      'title': '电子设计竞赛校选拔赛',
      'appealTime': '2024–05–21',
      'identifyInfo': '2024–05–20 优胜奖',
      'content': '对优胜奖积分有疑问，希望重新评估',
      'status': '审核驳回',
      'color': Colors.red
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text('申诉记录',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900,fontSize: 18)),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 顶部筛选
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(
                  label: '学年',
                  value: selectedYear,
                  items: const ['2023–2024', '2024–2025', '2025–2026'],
                  onChanged: (value) => setState(() => selectedYear = value!),
                ),
                _buildDropdown(
                  label: '赛事级别',
                  value: selectedLevel,
                  items: const ['全部', '国家级', '省级', '校级'],
                  onChanged: (value) => setState(() => selectedLevel = value!),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: appeals.length,
                itemBuilder: (context, index) {
                  final item = appeals[index];
                  return _buildAppealCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 下拉选择框组件
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
                        child: Text(item, style: const TextStyle(fontSize: 15)),
                      ))
                  .toList(),
              onChanged: onChanged,
              icon: const Icon(Icons.arrow_drop_down, size: 20),
            ),
          ),
        ),
      ],
    );
  }

  // 申诉卡片
  Widget _buildAppealCard(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14), 
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题 + 状态
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['title'],
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('申诉时间：${item['appealTime']}',
              style: const TextStyle(fontSize: 13, color: Colors.black87)),
          Text('识别信息：${item['identifyInfo']}',
              style: const TextStyle(fontSize: 13, color: Colors.black87)),
          Text('申诉内容：${item['content']}',
              style: const TextStyle(fontSize: 13, color: Colors.black87)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: item['color'].withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  item['status'],
                  style: TextStyle(
                      color: item['color'],
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
          ),
                ],
              ),
        ],
        
      ),
    );
  }
}
