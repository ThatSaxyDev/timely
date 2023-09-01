import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}

// Future<FilePickerResult?> pickImage() async {
//   final image = await FilePicker.platform.pickFiles(type: FileType.image);

//   return image;
// }

class MoneyInputFormat extends TextInputFormatter {
  final String separator;
  final int digits;
  MoneyInputFormat({
    required this.separator,
    required this.digits,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % digits == 0 && nonZeroIndex != text.length) {
        buffer.write(separator); // to add a single space after 4 digits
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

//!
//! SHOW BANNER
// showBanner(
//     {required BuildContext context,
//     required String theMessage,
//     required NotificationType theType}) {
//   ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
//       elevation: 4.0.sp,
//       padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 25.0.w),
//       forceActionsBelow: true,
//       backgroundColor: theType == NotificationType.failure
//           ? Colors.red.shade400
//           : theType == NotificationType.success
//               ? Colors.green.shade400
//               : Pallete.yellowColor,

//       //! THE CONTENT
//       content: Text(theMessage,
//           style: TextStyle(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w500,
//               color: Pallete.whiteColor)),

//       //! ACTIONS - DISMISS BUTTON
//       actions: [
//         SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//                 onPressed: () =>
//                     ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
//                 style: ElevatedButton.styleFrom(
//                     elevation: 0.0,
//                     padding: const EdgeInsets.all(12.0),
//                     shadowColor: Colors.transparent,
//                     backgroundColor: Colors.white24,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(21.0.r))),
//                 child: Text("Dismiss",
//                     style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Pallete.whiteColor))))
//       ]));

//   //! DISMISS AFTER 2 SECONDS
//   Timer(const Duration(milliseconds: 2500),
//       () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner());
// }

//! FETCH MONTH NAME
String getMonth({required DateTime dateTime}) {
  String theMonth = "";
  switch (dateTime.month) {
    case 1:
      theMonth = "January";
      return theMonth;
    case 2:
      theMonth = "February";
      return theMonth;
    case 3:
      theMonth = "March";
      return theMonth;
    case 4:
      theMonth = "April";
      return theMonth;
    case 5:
      theMonth = "May";
      return theMonth;
    case 6:
      theMonth = "June";
      return theMonth;
    case 7:
      theMonth = "July";
      return theMonth;
    case 8:
      theMonth = "August";
      return theMonth;
    case 9:
      theMonth = "September";
      return theMonth;
    case 10:
      theMonth = "October";
      return theMonth;
    case 11:
      theMonth = "November";
      return theMonth;
    case 12:
      theMonth = "December";
      return theMonth;

    //! DEFAULT VALUES
    default:
      theMonth = "Could not fetch the month";
      return theMonth;
  }
}

//! NUMBER FORMATTER - FOR REGULAR DIGIT FORMATTING
String formatNumber({double? value}) {
  var formatter = NumberFormat('#,###,###.###');
  return formatter.format(value!.toPrecision(3));
}

//! EXTENSION TO HELP FORMATTER
extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

//! NOTIFICATIONS SECTION
//! GET NOTIFICATION ITEM COLOUR
// Color getTransactionColour({required String transactionType}) {
//   Color textColour;
//   switch (transactionType) {
//     case "funding":
//       textColour = AppColors.green;
//       break;
//     case "transfer-in":
//       textColour = AppColors.green;
//       break;
//     default:
//       textColour = AppColors.primaryRed;
//   }

//   return textColour;
// }

//! KEYWORD
getTransactionNoticeKeyWord({required String transactionType}) {
  String keyWord;
  switch (transactionType) {
    case "funding":
      keyWord = "received";
      break;
    case "transfer-in":
      keyWord = "received";
      break;
    default:
      keyWord = "sent";
  }

  return keyWord;
}

//! ENDING NOTE
getTransactionEndingNote({required String transactionType}) {
  String keyWord;
  switch (transactionType) {
    case "funding":
      keyWord = "from";
      break;
    case "transfer-in":
      keyWord = "from";
      break;
    default:
      keyWord = "to";
  }

  return keyWord;
}

//! GET RECIPIENT
String getRecipient(
    {required String transactionType,
    required String recipientBankingInfo,
    required String recipientTag,
    required String senderBankingInfo,
    required String senderTag}) {
  String keyWord;
  switch (transactionType) {
    case "funding":
      keyWord = senderBankingInfo;
      break;
    case "transfer-in":
      keyWord = "@$senderTag";
      break;
    case "transfer-out":
      keyWord = "@$recipientTag";
      break;
    case "withdrawal":
      keyWord = recipientBankingInfo;
      break;
    default:
      keyWord = "";
  }

  return keyWord;
}

//! GET ICON
getIcon({required String transactionType}) {
  IconData icon;
  switch (transactionType) {
    case "funding":
      icon = Icons.arrow_downward_outlined;
      break;
    case "transfer-in":
      icon = Icons.arrow_downward_outlined;
      break;

    default:
      icon = Icons.arrow_upward_outlined;
  }

  return icon;
}

void displayDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

Color getRandomColor() {
  final random = Random();
  final r = 200 + random.nextInt(56); // generate values between 200 and 255
  final g = 100 + random.nextInt(100); // generate values between 100 and 155
  final b = 100 + random.nextInt(100); // generate values between 100 and 155
  return Color.fromRGBO(r, g, b, 1);
}