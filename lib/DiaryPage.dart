// import 'package:flutter/material.dart';
// import 'package:mybaby1/WriteDiaryPage.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:mybaby1/ViewSavedDiariesPage.dart';


// class DiaryPage extends StatefulWidget {
//   List<DiaryEntry>savedEntries = [];
//   @override
//   _DiaryPageState createState() =>_DiaryPageState();
// }
// class _DiaryPageState extends State<DiaryPage> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _contentController = TextEditingController();
//   TextEditingController _diaryController = TextEditingController();

  

//   String _diaryContent = '';




//   void _saveDiary() {
//   String diaryContent = _diaryController.text;
//   // 创建 DiaryEntry 对象并添加到列表中
//   DiaryEntry entry = DiaryEntry('日记标题', diaryContent); // 你可以根据实际情况设置标题
//   savedEntries.add(entry);
//   // 清空文本编辑器
//   _diaryController.clear();
// }






// // //////////////

// // // class _DiaryPageState extends State<DiaryPage> {
// // //   TextEditingController _diaryController = TextEditingController();

// // //   void _saveDiary() async {
// // //     String diaryContent = _diaryController.text;
// // //   }

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadDiaryContent();
// // //   }

// //   // Future<void> _loadDiaryContent() async {
// //   //   Directory appDocDir = await getApplicationDocumentsDirectory();
// //   //   String appDocPath = appDocDir.path;

// //   //   File diaryFile = File('$appDocPath/diary.txt');
// //   //   if (await diaryFile.exists()) {
// //   //     String content = await diaryFile.readAsString();
// //   //     setState(() {
// //   //       _diaryContent = content;
// //   //     });
// //   //   }
// //   // }
// // /////////////////////





//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('日记页面'),
//         backgroundColor: Colors.black,
//       ),
//       body:Padding(
//         padding: EdgeInsets.all(16.0),
//         child:Column(
//           children:<Widget>[
//           TextField(
//             maxLines: null,
//             onChanged: (value){
//               setState((){
//                 _diaryContent = value;
//               });
//             },
//             style: TextStyle(color:Colors.white),
//             decoration: InputDecoration(
//               hintText:'写下你的日记..',
//               hintStyle: TextStyle(color:Colors.grey),
//               border:InputBorder.none,
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _saveDiary,
//             child: Text('保存日记'),
          
//           ),
//   //         ElevatedButton(
//   //           onPressed: (){
//   //             Navigator.push(
//   //               context,
//   //               MaterialPageRoute(builder: (context)) => ViewSavedDiariesPage(widget.savedEntries)),
//   //             );
//   // }

//   //           },
//   //           child: Text('查看日记'),
//           ),
//       ),
//     ),
//     ]
//   }


            


 

    
    
    
  

// //       ////////////////////
// // //       body: Center(
// // //         child:Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Text('这是日记页面内容'),
// // //             ElevatedButton(
// // //               onPressed: (){
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(builder: (context) => WriteDiaryPage()),
// // //                 );
// // //               },
// // //               child: Text('写日记'),
// // //             ),


// // //           ],
// // //         ),
       
// // //       ),
// // //     );
// // //   }
// // // }
// // ////////////////////////

// void_saveDiary (){
//   print('日记已保存:$_diaryContent');
// }


  
  // ... rest of your code
  //除了带 /////////多号这个的是不用的，其余的都实现写好的



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mybaby1/WriteDiaryPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mybaby1/ViewSavedDiariesPage.dart';

class DiaryPage extends StatefulWidget {
  List<DiaryEntry> savedEntries = [];

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _diaryController = TextEditingController();
  String _diaryContent = '';

  void _saveDiary() {
    String diaryContent = _diaryController.text;
    DiaryEntry entry = DiaryEntry('日记标题', diaryContent);
    widget.savedEntries.add(entry);
    _diaryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('日记页面'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              maxLines: null,
              onChanged: (value) {
                setState(() {
                  _diaryContent = value;
                });
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '写下你的日记..',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveDiary,
              child: Text('保存日记'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewSavedDiariesPage(widget.savedEntries),
                  ),
                );
              },
              child: Text('查看保存的日记'),
            ),
          ],
        ),
      ),
    );
  }
}

class DiaryEntry {
  final String title;
  final String content;

  DiaryEntry(this.title, this.content);
}

class ViewSavedDiariesPage extends StatelessWidget {
  final List<DiaryEntry> savedEntries;

  ViewSavedDiariesPage(this.savedEntries);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查看保存的日记'),
      ),
      body: ListView.builder(
        itemCount: savedEntries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(savedEntries[index].title),
            subtitle: Text(savedEntries[index].content),
          );
        },
      ),
    );
  }
}

class WriteDiaryPage extends StatefulWidget {
  @override
  _WriteDiaryPageState createState() => _WriteDiaryPageState();
}

class _WriteDiaryPageState extends State<WriteDiaryPage> {
  TextEditingController _diaryController = TextEditingController();

  Future<void> _saveDiary() async {
    String diaryContent = _diaryController.text;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    File diaryFile = File('$appDocPath/diary.txt');
    await diaryFile.writeAsString(diaryContent);
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
            hintStyle: TextStyle(color: Colors.grey),
            //border: const InputBorder.none,
            
          ),
        ),
      ),
    );
  }
}



