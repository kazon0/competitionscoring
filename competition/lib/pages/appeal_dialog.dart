import 'package:flutter/material.dart';

class AppealDialog extends StatelessWidget {
  const AppealDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: const Center(
                child: Text('申诉申请',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                decoration: BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.8),
      left: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.8),
      right: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.8),
    ),
    borderRadius: BorderRadius.all(Radius.circular(3)),
  ),
              child: TextField(
              maxLines: 3,
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black87,),
              decoration: InputDecoration(
                hintText: '请详细描述积分疑问（如赛事信息错误、积分有误等）...',
                    hintStyle: TextStyle(
                      color: Colors.grey, 
                      fontSize: 14,
                      fontWeight: FontWeight.w900
                      ),
                border: InputBorder.none, // 去掉 TextField 自带边框
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload_outlined,
                      size: 32, color: Colors.blue[800]),
                  SizedBox(height: 8),
                  Text('拖拽文件至此处或点击',
                      style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Container(
                    
                    padding: const EdgeInsets.fromLTRB(12,0,12,12),
                    child: Text('支持 PDF, DOC, JPG, PNG 格式，单个文件不超过 50MB',
                    textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[550], fontSize: 11)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )
                    ),
                    child: const Text('取消', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )
                    ),
                    child: const Text('提交申诉',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
