import 'package:flutter/material.dart';

class ParentingHandbookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('育儿指南页面'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('这是育儿指南页面内容'),
      ),
    );
  }
}