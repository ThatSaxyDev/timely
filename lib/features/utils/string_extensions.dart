import 'dart:io';

import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart' show launchUrl;

const ext = 0;
final formatCurrency =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

//Formats the amount and returns a formatted amount
String formatPrice(String amount) {
  return formatCurrency.format(num.parse(amount)).toString();
}

extension StringCasingExtension on String {
  String? camelCase() => toBeginningOfSentenceCase(this);
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String? trimToken() => contains(":") ? split(":")[1].trim() : this;
  String? trimSpaces() => replaceAll(" ", "");
}

extension ImagePath on String {
  String get svg => 'lib/assets/images/$this.svg';
  String get png => 'lib/assets/images/$this.png';
  String get jpg => 'lib/assets/images/$this.jpg';
  String get gif => 'lib/assets/images/$this.gif';
}

extension NumExtensions on int {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
}

extension NumExtensionss on num {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
}

// void openUrl({String? url}) {
//   launchUrl(Uri.parse("http://$url"));
// }

// void openMailApp({String? receiver, String? title, String? body}) {
//   launchUrl(Uri.parse("mailto:$receiver?subject=$title&body=$body"));
// }
