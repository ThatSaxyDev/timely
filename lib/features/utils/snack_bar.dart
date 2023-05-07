// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        content: Text(text),
      ),
    );
}

// Future<FilePickerResult?> pickImage() async {
//   final image = await FilePicker.platform.pickFiles(type: FileType.image);

//   return image;
// }