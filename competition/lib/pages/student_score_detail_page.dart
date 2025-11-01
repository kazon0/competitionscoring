import 'package:flutter/material.dart';

class StudentScoreDetailPage extends StatelessWidget {
  final String studentName;

  const StudentScoreDetailPage({super.key, required this.studentName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> scoreData = [
      {
        'title': '全国大学生数学竞赛',
        'date': '2024-09-15',
        'award': '团队一等奖',
        'score': '15.0',
      },
      {
        'title': '大学生创新创业大赛',
        'date': '2024-05-05',
        'award': '二等奖',
        'score': '12.0',
      },
      {
        'title': '电子设计竞赛校选拔赛',
        'date': '2024-05-20',
        'award': '优胜奖',
        'score': '8.0',
      },
      {
        'title': '互联网挑战赛',
        'date': '2024-08-25',
        'award': '金奖',
        'score': '18.5',
      },
      {
        'title': '程序设计竞赛 ACM校赛',
        'date': '2024-11-11',
        'award': '二等奖',
        'score': '14.0',
      },
      {
        'title': '机器人竞技大赛初赛',
        'date': '2024-04-15',
        'award': '晋级奖',
        'score': '5.0',
      },
    ];

    double total = scoreData.fold(0, (sum, item) => sum + double.parse(item['score']!));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('查询学生积分', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(16),
        child: 
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 搜索框
            Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 2))
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(studentName,
                        style: const TextStyle(fontSize: 15, color: Colors.black87)),
                  ),
                ],
              ),
            ),

            // 表头
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 4, child: Text('赛事名称', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
                  Expanded(flex: 3, child: Text('识别信息', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
                  Expanded(flex: 2, child: Text('计算积分', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
                  Expanded(flex: 2, child: Center(child: Text('操作', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)))),
                ],
              ),
            ),

            const Divider(height: 1),

            // 表格内容
            Expanded(
              child: ListView.builder(
                itemCount: scoreData.length,
                itemBuilder: (context, index) {
                  final item = scoreData[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(item['title']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(item['date']!, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                              Text(item['award']!, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(item['score']!,
                              style: const TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text('查看',
                                style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            // 总积分
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[ Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('总积分：${total.toStringAsFixed(1)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
              ),]
            ),
          ],
        ),
        ),
      ),
    );
  }
}
