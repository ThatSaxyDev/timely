//! HERE IS THE FADE ANIMATION USED THROUGHOUT THE APPLICATION
//! IT'S CUSTOM TWEAKED TO MEET MY REQUIREMENTS / NEEDS.
//! THE LIBRARY ARE LEGACY LIBRARIES, BUT I'M USING THEM ANYWAYS

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AppFadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const AppFadeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    //! ANIMATION TWEEN DEFINITION
    final MovieTween animationTween = MovieTween()
      //! MOVE VERTICALLY
      ..scene(
              begin: const Duration(milliseconds: 0),
              duration: Duration(milliseconds: (250 * delay).round()))
          .tween("translateY", Tween(begin: 30.0, end: 0.0))

      //! OPACITY TRACK
      ..scene(
              begin: const Duration(milliseconds: 0),
              end: Duration(milliseconds: (250 * delay).round()))
          .tween("opacity", Tween(begin: 0.0, end: 1.0));

    return PlayAnimationBuilder<Movie>(
        tween: animationTween,
        duration: Duration(milliseconds: (250 * delay).round()),
        child: child,
        builder: (context, value, child) => Opacity(
            opacity: value.get("opacity"),
            child: Transform.translate(
                offset: Offset(0.0, value.get("translateY")), child: child)));
  }
}
