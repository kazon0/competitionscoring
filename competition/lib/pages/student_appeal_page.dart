import 'package:flutter/material.dart';

class StudentAppealPage extends StatefulWidget {
  const StudentAppealPage({super.key});

  @override
  State<StudentAppealPage> createState() => _StudentAppealPageState();
}

class _StudentAppealPageState extends State<StudentAppealPage> {
  String selectedYear = '2024-2025';
  String selectedLevel = '全部';
  String selectedStatus = '待审核';

  final List<String> yearOptions = ['2024-2025', '2023-2024', '2022-2023'];
  final List<String> levelOptions = ['全部', '校级', '省级', '国家级'];
  final List<String> statusOptions = ['待审核', '审核通过', '审核驳回'];

  final List<Map<String, dynamic>> appeals = [
    {
      'title': '全国大学生数学建模竞赛',
      'date': '2024-09-16',
      'info': '2024-09-15 团队一等奖',
      'content': '积分计算有误，实际应为16.0',
      'student': '小明',
      'status': '待审核',
      'color': Colors.orange
    },
    {
      'title': '大学生创新创业大赛',
      'date': '2024-07-11',
      'info': '2024-07-10 二等奖',
      'content': '赛事信息错误，团队成员信息有误',
      'student': '小红',
      'status': '审核通过',
      'color': Colors.green
    },
    {
      'title': '电子设计竞赛校选拔赛',
      'date': '2024-05-21',
      'info': '2024-05-20 优胜奖',
      'content': '对优胜奖积分有疑问，希望重新评估',
      'student': '小刚',
      'status': '审核驳回',
      'color': Colors.red
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text(
          '学生申诉',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 18),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 顶部筛选行
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown('学年', selectedYear, yearOptions, (v) {
                  setState(() => selectedYear = v!);
                }),
                const SizedBox(width: 10),
                _buildDropdown('赛事级别', selectedLevel, levelOptions, (v) {
                  setState(() => selectedLevel = v!);
                }),
                const SizedBox(width: 10),
                _buildDropdown('状态', selectedStatus, statusOptions, (v) {
                  setState(() => selectedStatus = v!);
                }),
              ],
            ),
            const SizedBox(height: 16),

            // 内容卡片列表
            Expanded(
              child: ListView.builder(
                itemCount: appeals.length,
                itemBuilder: (context, index) {
                  final item = appeals[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),
                        Text('申诉时间：${item['date']}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black87)),
                        Text('识别信息：${item['info']}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black87)),
                        Text('申诉内容：${item['content']}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black87)),
                        Text('申诉人：${item['student']}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black87)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              decoration: BoxDecoration(
                                color: item['color'].withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: item['color']),
                              ),
                              child: Text(
                                item['status'],
                                style: TextStyle(
                                  color: item['color'],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 通用下拉菜单构建
  Widget _buildDropdown(String label, String value, List<String> options,
      ValueChanged<String?> onChanged) {
    return Expanded(
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            onChanged: onChanged,
            items: options
                .map((e) =>
                    DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,maxLines: 1,)))
                .toList(),
          ),
        ),
      ),
    );
  }
}
