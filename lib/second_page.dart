import 'package:flutter/material.dart';
import 'package:mybaby1/PhotoAlbumPage.dart';
import 'option_button.dart';
import 'package:mybaby1/VideoPage.dart';
import 'package:mybaby1/DiaryPage.dart';
import 'package:mybaby1/ParentingHandbookPage.dart';
import 'package:mybaby1/ParentingHandbookPage2.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('혁이의 개인 시스템'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Image.asset('assets/heh.png'), // 替换成你的本地图片路径
          //SizedBox(height: 10),
          // Expanded(
          //   child:OptionButton('相册',Icons.favorite,(){
          //     //处理相册的点击事件
          //     //跳转到相册的页面
          //   }),
          // ),
          // SizedBox(height:10) // 这是添加间距的地方。
          // Expanded(
          //   child:OptionButton('日记',Icons.favorite,(){
          //     //处理点击日记的事件
          //     //跳转到日记页面
          //   }),

          // ),
         // SizedBox(height: 20),


         //这是添加一个把爱心横着排的一个功能代码


         Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:AssetImage('assets/heh.png'),//设置本地头像的路径
              radius:30//设置半径
            ),
            SizedBox(width: 10),//添加间距
            Expanded(
              child:TextField(
                decoration:InputDecoration(
                  hintText:'기분이 어때?',
                  hintStyle: TextStyle(color:Colors.white),//设置提示文本颜色
                ),
                style:TextStyle(color:Colors.white),
              ),
            ),
          ],
         ),
         SizedBox(height: 100),
         Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children:<Widget>[
  
            

          
         




          OptionButton('相册', Icons.favorite, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PhotoAlbumPage()),
            );
            // 处理相册点击事件
            // 跳转到相册页面
          }),
          OptionButton('影像', Icons.favorite, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoPage()),
            );
            // 处理影像点击事件
            // 跳转到影像页面
          }),
          OptionButton('日记', Icons.favorite, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiaryPage()),
            );
            // 处理日记点击事件
            // 跳转到日记页面
          }),
          ],
         ),
//////////////////// 到这里为止是吧心形变成横着
          SizedBox(height:50),
          //Row(//这里换成了 Column来让育儿指南和如何和孩子好好相处变成竖着排列
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,//使得按钮垂直居中
            crossAxisAlignment: CrossAxisAlignment.stretch,//按钮宽度充满整个屏幕
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParentingHandbookPage()),

                  );
                  //处理育儿指南按钮点击事件
                  //跳转到育儿指南页面
                },
                style:ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 186, 59, 255),
                padding:EdgeInsets.symmetric(vertical: 55,horizontal: 100),
                ),
                child:Text('育儿指南, 帮助您快速和孩子建立良好的亲子关系！'),
              ),
              //下面是添加间距的意思
              SizedBox(height: 80),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParentingHandbookPage2()),
                  );
                  //处理如何和孩子快乐相处按钮点击事件
                  //跳转到如何和孩子快乐相处页面
                },
                style:ElevatedButton.styleFrom(primary: Colors.pink,
                padding: EdgeInsets.symmetric(vertical: 59,horizontal: 100),
                //上面这个代码是调节按钮的长和宽
                ),
                child:Text('如何和孩子快乐相处'),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            '希望赫赫开心每一天',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}



