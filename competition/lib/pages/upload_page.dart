import 'package:flutter/material.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text('材料上传',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 18)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // 上传区域
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '拖拽文件到此处或点击上传',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '支持PDF、DOC、JPG、PNG格式，单个文件不超过50MB',
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text('上传队列 (2)',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            const SizedBox(height: 12),

            // 文件1
            _buildUploadingItem(
              name: '创新设计大赛方案.pdf',
              progress: 0.8,
              status: '已上传38.5MB',
              iconColor: Colors.blue,
            ),

            const SizedBox(height: 10),

            // 文件2
            _buildCompletedItem(
              name: '作品说明书.docx',
              status: '上传完成',
              color: Colors.green,
            ),

            const SizedBox(height: 16),
            const Text('最近上传记录',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            const SizedBox(height: 12),

            _buildRecordItem(
              name: '科技论文竞赛模板.pdf',
              status: '审核通过',
              statusColor: Colors.green,
              actionText: '查看详情',
            ),
            _buildRecordItem(
              name: '创意计划书.docx',
              status: '待评审',
              statusColor: Colors.orange,
              actionText: '查看详情',
            ),
            _buildRecordItem(
              name: '艺术设计作品集.zip',
              status: '格式错误',
              statusColor: Colors.red,
              actionText: '重新上传',
            ),
          ],
        ),
      ),
    );
  }

  // 上传中
  Widget _buildUploadingItem({
    required String name,
    required double progress,
    required String status,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:[
          BoxShadow(
          color: Colors.grey.withOpacity(0.1)
          ,blurRadius: 10,offset: const Offset(0,2)
        ),]
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontSize: 15)),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[200],
          color: iconColor,
          minHeight: 4,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 4),
        Text(status, style: const TextStyle(fontSize: 13, color: Colors.black54)),
      ],
    ),
    );
  }

  // 上传完成
  Widget _buildCompletedItem({
    required String name,
    required String status,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:[
          BoxShadow(
          color: Colors.grey.withOpacity(0.1)
          ,blurRadius: 10,offset: const Offset(0,2)
        ),]
        ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontSize: 15)),
            Text(status,
                style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: 1.0,
          backgroundColor: Colors.grey[200],
          color: color,
          minHeight: 4,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    ),
    );
  }

  // 上传记录
Widget _buildRecordItem({
  required String name,
  required String status,
  required Color statusColor,
  required String actionText,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 13),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0xFFE0E0E0)), 
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 左侧文件名 + 状态标签
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 10),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2), 
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
              child: Text(
                status,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ]
            ),
          ],
        ),
        Text(
          actionText,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
}
