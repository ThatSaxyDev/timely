// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// void showPicker(BuildContext context, Widget child) {
//   showCupertinoModalPopup<void>(
//     context: context,
//     builder: (BuildContext context) => Container(
//       height: 216,
//       padding: const EdgeInsets.only(top: 6.0),
//       // The Bottom margin is provided to align the popup above the system navigation bar.
//       margin: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       decoration: BoxDecoration(
//         color: CupertinoColors.systemBackground.resolveFrom(context),
//         borderRadius: BorderRadius.circular(15.r)
//       ),
//       // Provide a background color for the popup.

//       // Use a SafeArea widget to avoid system overlaps.
//       child: SafeArea(
//         top: false,
//         child: child,
//       ),
//     ),
//   );
// }

// Future<List<File>> pickImages() async {
//   List<File> images = [];
//   try {
//     var files = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       allowMultiple: true,
//     );
//     if (files != null && files.files.isNotEmpty) {
//       for (int i = 0; i < files.files.length; i++) {
//         images.add(
//           File(files.files[i].path!),
//         );
//       }
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return images;
// }

// Future<FilePickerResult?> pickImage() async {
//   final image = await FilePicker.platform.pickFiles(type: FileType.image);

//   return image;
// }