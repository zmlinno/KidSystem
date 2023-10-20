import 'package:flutter/material.dart';


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

