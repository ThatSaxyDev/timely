//! APP CUSTOM VALUE LISTENABLE PROVIDER
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppMultiListenableProvider<FirstValue, SecondValue>
    extends StatelessWidget {
  final ValueListenable<FirstValue> firstValue;
  final ValueListenable<SecondValue> secondValue;
  final Widget child;
  final Function(BuildContext context, FirstValue firstValue,
      SecondValue secondValue, Widget child) builder;

  //! CONSTRUCTOR
  const AppMultiListenableProvider(
      {super.key,
      required this.firstValue,
      required this.secondValue,
      required this.child,
      required this.builder});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<FirstValue>(
      valueListenable: firstValue,
      builder: (_, firstValue, __) => ValueListenableBuilder<SecondValue>(
          valueListenable: secondValue,
          builder: (context, secondValue, __) =>
              builder(context, firstValue, secondValue, child)));
}
