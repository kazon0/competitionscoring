import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'upload_page.dart';
import 'score_detail_page.dart';
import 'appeal_record_page.dart';
import 'login_page.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child:Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text('个人主页',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 18)),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
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
                  blurRadius:10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
             
              mainAxisAlignment: MainAxisAlignment.center,//垂直居中
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                const SizedBox(width: 16),
                SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      '小明同学',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '账号：20240001',
                      style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w600),
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
            icon: Icons.cloud_upload,
            color: Colors.blue,
            title: '赛事材料上传',
            page: const UploadPage(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.insert_chart_outlined,
            color: Colors.green,
            title: '个人积分明细',
            page: const ScoreDetailPage(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.description,
            color: Colors.orange,
            title: '申诉记录',
            page: const AppealRecordPage(),
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
            offset: Offset(0, 2),
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
