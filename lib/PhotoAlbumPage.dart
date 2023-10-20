import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//////
// class PhotoAlbumPage extends StatelessWidget {


//     @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('影像页面'),
//       ),
//       body: Center(
//         child: Text('这是影像页面内容'),
//       ),
//     );
//   }
// }
////////








class PhotoAlbumPage extends StatefulWidget {
  @override
  _PhotoAlbumPageState createState() => _PhotoAlbumPageState();
}

class _PhotoAlbumPageState extends State<PhotoAlbumPage> {
  List<File> _images = [];
  late String photoDirPath;

  SharedPreferences? _prefs;
  //这个是刚刚新加的



    @override
  void initState() {
    super.initState();
    initDirectory();
    initPrefs();
  }
    Future<void> initDirectory() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    photoDirPath = '$appDocPath/photos';
    Directory photoDir = Directory(photoDirPath);
    if (!await photoDir.exists()) {
      await photoDir.create(recursive: true);
    }
  }

    Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? imagePaths = _prefs?.getStringList('imagePaths');
    if (imagePaths != null) {
      setState(() {
        _images = imagePaths.map((path) => File(path)).toList();
      });
    }
  }


//// 这是相片的保存功能。
  Future<void> _saveImagePaths() async {
    List<String> imagePaths = _images.map((image) => image.path).toList();
    await _prefs?.setStringList('imagePaths', imagePaths);
  }

  ////


  Future<void> _pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(

   
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {

      setState(() {
        _images = result?.files.map((file) => File(file.path ?? '')).toList() ?? [];

       

      });
      await _saveImagePaths();
      
    }
  }

  //// 这个上面是照片添加保存的一个功能


////// 2023 10 18 18:42
  //下面是一个删除照片的功能
  Future<void> _deleteImage(File image) async{
    setState(() {
      _images.remove(image);
    });
  

  await _saveImagePaths();

  try{
    await image.delete();
  } catch(e){
    print('Error deleting image:$e');
  }
//
}
//上面这一个代码是删除功能

//2023

//一会在改这个代码












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///////
      backgroundColor:Colors.black,
      appBar: AppBar(
        title: Text('相册页面'),
        backgroundColor: Colors.black,

      ),
      /////中间的这个方法使整个屏幕都变成黑色
      //backgroundColor: Colors.black,//设置背景颜色为黑色
      body: Center(
       
        child: _images.isEmpty
            ? Text('请点击按钮选择图片',style: TextStyle(color: Colors.white))
            :  Column(
               children: _images
                .map(
                  // (image) => Image.file(
                  (image) => Column(
                    children:[
                      Image.file(
                        image,
                        fit:BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '和儿子玩耍的一天',
                        style:TextStyle(color:Colors.white),
                      ),
                      //从这里开始就是删除照片的功能和操作
                      ElevatedButton(
                        onPressed: () => _deleteImage(image),
                        child: Text('删除图片'),
                      )
                      //////
                    ],
                  ),
                )
                .toList(),
            ),


                 
//         image,
//         fit: BoxFit.cover,
//         width: MediaQuery.of(context).size.width,
//         height: 300,
//       ),
//     )
//     .toList(),
// ),

            
            //屏蔽下面的代码是替换成可以把上传的图片调到任意尺寸
            // : Column(
            //     children: _images.map((image) => Image.file(image)).toList(),
            //   ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImages,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}





