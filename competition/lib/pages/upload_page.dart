import 'package:flutter/material.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('材料上传')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: const Text('拖拽文件到此处或点击上传\n支持PDF、DOC、JPG、PNG格式'),
            ),
            const SizedBox(height: 20),
            const Text('上传队列', style: TextStyle(fontWeight: FontWeight.bold)),
            const ListTile(
              title: Text('创新设计大赛方案.pdf'),
              subtitle: Text('已上传38.5MB'),
              trailing: Icon(Icons.check_circle, color: Colors.blue),
            ),
            const ListTile(
              title: Text('作品说明书.docx'),
              subtitle: Text('上传完成'),
              trailing: Icon(Icons.done, color: Colors.green),
            ),
            const Divider(),
            const Text('最近上传记录', style: TextStyle(fontWeight: FontWeight.bold)),
            const ListTile(
              title: Text('科技论文竞赛模板.pdf'),
              trailing: Text('审核通过', style: TextStyle(color: Colors.green)),
            ),
            const ListTile(
              title: Text('创意计划书.docx'),
              trailing: Text('待评审', style: TextStyle(color: Colors.orange)),
            ),
            const ListTile(
              title: Text('艺术设计作品集.zip'),
              trailing: Text('格式错误', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
