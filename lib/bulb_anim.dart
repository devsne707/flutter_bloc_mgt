//ANIMATION Bulb Screen create

import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedBuilder].

// void main() => runApp(const AnimatedBuilderExampleApp());

class AnimatedBuilderExampleApp extends StatelessWidget {
  const AnimatedBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: AnimatedBuilderExample())),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 15),
    vsync: this,
  )..repeat(reverse: true);
  late final AnimationController bulbController = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  )..repeat(reverse: true);

  late Animation<double> _animation =
      Tween<double>(begin: 0, end: 50).animate(bulbController);
  int bulbCount = 10;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update the list of bulbs whenever the widget is rebuilt
    updateBulbList();
  }

  void updateBulbList() {
    final width = MediaQuery.of(context).size.width;
    bulbCount = (width / 25).floor(); // Adjust the divisor to change spacing
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            //angle: _controller.value * 2.0 * math.pi,
            offset: Offset(_controller.value * 2.0 * math.pi, 1),
            //scale: _controller.value * 2 * math.pi,
            child: AnimatedContainer(
              color: Colors.black,
              margin: EdgeInsets.zero,
              duration: Duration(milliseconds: 400),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                //         width: 200.0,
                height: MediaQuery.sizeOf(context).height * .2,
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        radius: 1.1,
                        center: Alignment.center,
                        focal: Alignment(0, -.6),
                        colors: [
                      //Custom color set
                      Colors.primaries[(math.Random().nextInt(5).toInt())]
                          .shade300
                          .withOpacity((_controller.value * 1)),

                      //  Colors.white.withOpacity((_controller.value * 1)),
                      Colors.black.withOpacity((_controller.value * 1)),
                    ])),
                child: Center(
                    child: Stack(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        bulbCount,
                        (i) => Column(
                              children: [
                                ((i + 1) % 5) == 0
                                    ? AnimatedContainer(
                                        duration: Duration(milliseconds: 1200),
                                        height: (i + 1) % 2 == 0
                                            ? _animation.value * 3
                                            : _animation.value * 5,
                                        color: Colors.black12,
                                        width: 3,
                                      )
                                    : i % 2 == 0
                                        ? AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 800),
                                            //height: _animation.value,
                                            color: Colors.black26,
                                            width: 3)
                                        : AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 1200),
                                            //   height: _animation.value / 2.8,
                                            color: Colors.black12,
                                            width: 3,
                                          ),
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: (i + 1) % 5 == 0
                                      ? RotatedBox(
                                          quarterTurns:
                                              ((pi * 50) * _controller.value)
                                                  .floor(),
                                          child: AnimatedScale(
                                            duration:
                                                Duration(milliseconds: 400),
                                            scale: _animation.value / 30,
                                            child: Icon(
                                              (i + 1) % 2 == 0
                                                  ? Icons.stop_rounded
                                                  : Icons.star_border,
                                              color: (i + 1) % 2 == 0
                                                  ? Colors.primaries[
                                                          (math.Random()
                                                              .nextInt(2)
                                                              .toInt())]
                                                      .withOpacity(
                                                          _controller.value * 1)
                                                  : Colors.white.withOpacity(
                                                      _controller.value * 1),
                                            ),
                                          ),
                                        )
                                      : Icon(Icons.lightbulb_rounded,
                                          color: i % 2 == 0

                                              //Custom color set
                                              //Colors.primaries[(math.Random().nextInt(18).toInt())].shade300
                                              //                       .withOpacity((_controller.value * 1)),
                                              ? Colors
                                                  .primaries[(math.Random()
                                                      .nextInt(5)
                                                      .toInt())]
                                                  .shade300
                                                  .withOpacity(
                                                      (_controller.value * 1))
                                              : Colors.primaries[(math.Random()
                                                      .nextInt(2)
                                                      .toInt())]
                                                  .withOpacity(
                                                      (_controller.value * 1))),
                                ),
                              ],
                            )),
                  ),

                  Center(
                    child: BorderedText(
                      text: "Happy Diwali",
                      outlineWidth: 5,
                      fontSize: MediaQuery.sizeOf(context).height * .2,
                      outlineColor: Colors
                          .primaries[(math.Random().nextInt(5).toInt())]
                          .withOpacity((_controller.value * 1)),
                      textColor:
                          Colors.white.withOpacity((_controller.value * 1)),
                    ),
                  )
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       height: 100,
                  //       width: 2,
                  //       color: Colors.grey,
                  //       //  child: VerticalDivider(color: Colors.grey)
                  //     ),
                  //     AnimatedContainer(
                  //         alignment: Alignment.center,
                  //         duration: Duration(milliseconds: 400),
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           //color: Colors.white60.withOpacity((_controller.value * 1)),
                  //         ),
                  //         child: RotatedBox(
                  //           quarterTurns: 2,
                  //           child: Icon(Icons.lightbulb_rounded,
                  //               color: Colors.white
                  //                   .withOpacity((_controller.value * 1))),
                  //         )),
                  //     SizedBox(height: 50),

                  //     //                   Transform.scale(
                  //     //                       scale: _controller.value * 2 * math.pi,
                  //     //                       child: Text("TEST",
                  //     //                           textAlign: TextAlign.center,
                  //     //                           style: TextStyle(
                  //     //                               color: Colors
                  //     //                                   .primaries[
                  //     //                                       (math.Random().nextInt(10).toInt())]
                  //     //                                   .shade300
                  //     //                                   .withOpacity((_controller.value * 1)))))
                  //   ],
                  // )
                ])),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BorderedText extends StatelessWidget {
  final String text;
  final Color outlineColor;
  final Color textColor;
  final double fontSize;
  final double outlineWidth;

  const BorderedText({
    Key? key,
    required this.text,
    required this.outlineColor,
    required this.textColor,
    required this.fontSize,
    required this.outlineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outline text
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: outlineColor,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: outlineColor,
                offset: Offset(1.0, 1.0),
                blurRadius: outlineWidth,
              ),
              Shadow(
                color: outlineColor,
                offset: Offset(-1.0, -1.0),
                blurRadius: outlineWidth,
              ),
              Shadow(
                color: outlineColor,
                offset: Offset(1.0, -1.0),
                blurRadius: outlineWidth,
              ),
              Shadow(
                color: outlineColor,
                offset: Offset(-1.0, 1.0),
                blurRadius: outlineWidth,
              ),
            ],
          ),
        ),
        // Actual text
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
