import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ranking_page.dart';
import 'student_appeal_page.dart';
import 'login_page.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: const Text(
            '个人主页',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false, // 不显示系统默认返回按钮
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const SizedBox(height: 20),
            // 顶部个人信息卡
            Container(
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        '辅导员',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '账号：00076',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 菜单列表
            _buildMenuItem(
              context,
              icon: Icons.leaderboard,
              color: Colors.blue,
              title: '积分排名',
              page: const RankingPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.assignment,
              color: Colors.green,
              title: '学生申诉',
              page: const StudentAppealPage(),
            ),

            const SizedBox(height: 40),

            // 退出按钮
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text(
                  '退出登录',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 菜单卡片
  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required Color color,
      required String title,
      required Widget page}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      ),
    );
  }
}
