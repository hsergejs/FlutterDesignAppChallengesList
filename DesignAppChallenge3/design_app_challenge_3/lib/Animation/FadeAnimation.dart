import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {

  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = new MultiTrackTween([
      new Track("opacity").add(
        new Duration(milliseconds: 500),
        new Tween(begin: 0.0, end: 1.0)
      ),
      new Track("translateY").add(
        new Duration(milliseconds: 500),
        new Tween(begin: -30.0, end: 0.0),
        curve: Curves.easeOut,
      ),
    ]);

    return ControlledAnimation(
      delay: new Duration(
        milliseconds: (500*delay).round(),
      ),
      duration: tween.duration,
      child: child,
      builderWithChild: (context, child, animation) => new Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
          offset: new Offset(0, animation["translateY"]),
          child: child,
        ),
      ),
    );
  }
}
