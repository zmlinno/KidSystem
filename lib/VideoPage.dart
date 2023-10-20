// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';



//先把这个屏蔽掉，这个是一开始最初的画面
// class VideoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('影像页面'),
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: Text('这是影像页面内容'),
//       ),
//     );
//   }
// }
///////////










import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? _controller;
  File? _videoFile;

  @override
  void initState() {
    super.initState();
    _loadSavedVideo();
  }

  Future<void> _loadSavedVideo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? videoPath = prefs.getString('video_path');

    if (videoPath != null) {
      File videoFile = File(videoPath);
      setState(() {
        _videoFile = videoFile;
        _controller = VideoPlayerController.file(videoFile);

        Future.delayed(Duration(milliseconds: 100), () {
          _controller!.initialize().then((_) {
            _controller!.setLooping(true);
          });
        });
      });
    }
  }

  Future<void> _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        _videoFile = file;
        _controller = VideoPlayerController.file(file);

        Future.delayed(Duration(milliseconds: 100), () {
          _controller!.initialize().then((_) {
            _controller!.setLooping(true);
            _controller!.play();
          });
        });

        _saveVideoPath(file.path);
      });
    }
  }

  Future<void> _saveVideoPath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('video_path', path);
  }

  Future<void> _saveVideo() async {
    if (_videoFile != null) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      String filePath = '$appDocPath/video.mp4';

      File destinationFile = File(filePath);
      await _videoFile!.copy(destinationFile.path);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('视频已保存到本地'),
      ));
    }
  }

  Future<void> _deleteVideo() async {
    if (_videoFile != null) {
      await _videoFile!.delete();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('video_path');
      setState(() {
        _videoFile = null;
        _controller?.dispose();
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('视频已删除'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('影像页面'),
        backgroundColor: Colors.black,
        actions: [
          if (_videoFile != null)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _deleteVideo,
            ),
        ],
      ),
      body: Center(
        child: _videoFile != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveVideo,
                    child: Text('保存视频'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: _pickVideo,
                child: Text('上传视频'),
              ),
      ),
    );
  }
}







