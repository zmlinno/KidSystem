import 'package:flutter/material.dart';
import 'second_page.dart';
import 'option_button.dart';
//wps,cpm/pert 作业



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Baby System',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height:100), 
            TextField(
              style: TextStyle(color:Colors.white),
              decoration: InputDecoration(

                hintText: '아이디',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                )
              ),
            ),
            SizedBox(height: 50),
            TextField(
              style: TextStyle(color:Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                hintText: '비밀번호',
                hintStyle: TextStyle(color:Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                )
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                // 处理登录逻辑
                // 如果登录成功，跳转到第二页
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              style:ElevatedButton.styleFrom(
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(double.infinity,20),
                padding: EdgeInsets.all(16),
                primary: Colors.orange,
              ),


              child: Text(
                '로그인',
                style: TextStyle(fontSize:20),
                ),
            ),
          ],
        ),
      ),
    );
  }
}


