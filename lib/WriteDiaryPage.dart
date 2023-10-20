// import 'package:flutter/material.dart';

// class WriteDiaryPage extends StatefulWidget {
//   @override
//   _WriteDiaryPageState createState() => _WriteDiaryPageState();
// }

// class _WriteDiaryPageState extends State<WriteDiaryPage> {
//   TextEditingController _diaryController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('写日记'),
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: () {
//               // 在这里保存日记
//               String diaryContent = _diaryController.text;
//               // TODO: 将日记内容保存到应用中
//               // 例如使用文件或数据库来保存
//               Navigator.pop(context); // 返回日记页面
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: TextField(
//           controller: _diaryController,
//           maxLines: null,
//           expands: true,
//           decoration: InputDecoration(
//             hintText: '写下你的日记...',
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class WriteDiaryPage extends StatefulWidget {
  @override
  _WriteDiaryPageState createState() => _WriteDiaryPageState();
}

class _WriteDiaryPageState extends State<WriteDiaryPage> {
  TextEditingController _diaryController = TextEditingController();

  Future<void> _saveDiary() async {
    String diaryContent = _diaryController.text;

    // 获取应用程序文档目录
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    // 创建一个新的日记文件
    File diaryFile = File('$appDocPath/diary.txt');
    await diaryFile.writeAsString(diaryContent);

    // 提示保存成功
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('保存成功'),
          content: Text('日记已成功保存！'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('写日记'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveDiary,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _diaryController,
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '开始写下你的日记...',
          ),
        ),
      ),
    );
  }
}
