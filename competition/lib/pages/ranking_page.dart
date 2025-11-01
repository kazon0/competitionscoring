import 'package:flutter/material.dart';
import 'student_score_detail_page.dart'; 

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int currentPage = 1;
  final int itemsPerPage = 5;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> allData = List.generate(15, (index) {
    return {
      'rank': index + 1,
      'year': '2024-2025',
      'name': ['小明', '小红', '小刚', '小李', '小赵', '小王'][index % 6],
      'college': ['计算机', '设计', '管理'][index % 3],
      'score': (70 - index * 1.5).toStringAsFixed(1),
    };
  });

  String selectedYear = '2024-2025';
  String selectedCollege = '全部';
  final List<String> yearOptions = ['2024-2025', '2023-2024', '2022-2023'];
  final List<String> collegeOptions = ['全部', '计算机', '设计', '管理'];

  @override
  Widget build(BuildContext context) {
    // 当前页数据
    final start = (currentPage - 1) * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, allData.length);
    final currentData = allData.sublist(start, end);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text(
          '积分排名',
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
            const SizedBox(height: 15),
            // 搜索栏
            Container(
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _handleSearch, // 点击图标也可触发搜索
                  ),
                  hintText: '搜索学生姓名',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onSubmitted: (_) => _handleSearch(), // 按回车搜索
              ),
            ),

            const SizedBox(height: 25),

            // 筛选行
            Container(
              padding: const EdgeInsets.all(12),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown('学年', selectedYear, yearOptions, (v) {
                  setState(() => selectedYear = v!);
                }),
                 const SizedBox(width: 16),
                _buildDropdown('学院', selectedCollege, collegeOptions, (v) {
                  setState(() => selectedCollege = v!);
                }),
              ],
            ),
            ),

            const SizedBox(height: 16),

            // 表格头
            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Row(
                children: [
                  Expanded(flex: 1, child: Center(child: Text('排名', style: TextStyle(fontWeight: FontWeight.bold)))),
                  Expanded(flex: 2, child: Center(child: Text('学年', style: TextStyle(fontWeight: FontWeight.bold)))),
                  Expanded(flex: 2, child: Center(child: Text('姓名', style: TextStyle(fontWeight: FontWeight.bold)))),
                  Expanded(flex: 2, child: Center(child: Text('学院', style: TextStyle(fontWeight: FontWeight.bold)))),
                  Expanded(flex: 2, child: Center(child: Text('积分', style: TextStyle(fontWeight: FontWeight.bold)))),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 1),

            // 表格数据
            Expanded(
              child: ListView.separated(
                itemCount: currentData.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = currentData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: Center(child: Text(item['rank'].toString()))),
                        Expanded(flex: 2, child: Center(child: Text(item['year']))),
                        Expanded(flex: 2, child: Center(child: Text(item['name']))),
                        Expanded(flex: 2, child: Center(child: Text(item['college']))),
                        Expanded(flex: 2, child: Center(child: Text(item['score']))),
                      ],
                    ),
                  );
                },
              ),
            ),

            const Divider(thickness: 1, height: 1),

            // 分页控制
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 1
                        ? () => setState(() => currentPage--)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('上一页',style: TextStyle(fontSize: 13),),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$currentPage / ${((allData.length - 1) ~/ itemsPerPage) + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: end < allData.length
                        ? () => setState(() => currentPage++)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('下一页',style: TextStyle(fontSize: 13)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

    //  搜索逻辑：跳转详情页
  void _handleSearch() {
    final input = _searchController.text.trim();
    if (input.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StudentScoreDetailPage(studentName: input),
      ),
    );
  }

  // 下拉框组件
  Widget _buildDropdown(String label, String value, List<String> options, ValueChanged<String?> onChanged) {
    return Expanded(
      child: Container(
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
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
        ),
      ),
    );
  }
}
