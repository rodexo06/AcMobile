// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class TypewriterTween extends Tween<String> {
  TypewriterTween({String begin = 'Aguarde um momento', String end})
      : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    var cutoff = (end.length * t).round();
    return end.substring(0, cutoff);
  }
}

class CustomTweenDemo extends StatefulWidget {
  static const String routeName = '/basics/custom_tweens';

  @override
  _CustomTweenDemoState createState() => _CustomTweenDemoState();
}

class _CustomTweenDemoState extends State<CustomTweenDemo>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 2);
  static const String message = "...";
  AnimationController controller;
  Animation<String> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: _duration)
      ..repeat();
    animation = TypewriterTween(end: message).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Text('Aguardando dados${animation.value}',
                style: TextStyle(fontSize: 16, fontFamily: 'SpecialElite'));
          },
        ),
      ),
    );
  }
}

const String loremIpsum = '''
...
''';
