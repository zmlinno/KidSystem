import 'dart:io';
import 'package:path_provider/path_provider.dart';
// 导入path_provider库

// ...

Future<void> initDirectory() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  String photoDirPath = '$appDocPath/photos';
  Directory photoDir = Directory(photoDirPath);
  if (!await photoDir.exists()) {
    await photoDir.create(recursive: true);
  }
}