import 'dart:math';

import 'package:dribbble_shots_2022/constants/shot_02_constants.dart';
import 'package:dribbble_shots_2022/icon_fonts/icon_pack_outline_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shot02Home extends StatefulWidget {
  const Shot02Home({Key? key}) : super(key: key);

  @override
  _Shot02HomeState createState() => _Shot02HomeState();
}

class _Shot02HomeState extends State<Shot02Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Shot02().bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 18,
                child: Image.asset(
                  "assets/images/shot_02_logo.png",
                  color: Shot02().primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  "SMART BULB",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                spacing: 26,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                children: List.generate(
                  5,
                  (i) => i == 2
                      ? IndicatorDot(
                          color: Shot02().primaryColor,
                          width: 15,
                        )
                      : IndicatorDot(
                          color: Colors.grey.shade300,
                          width: 10,
                        ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_rounded,
                    size: 20,
                    color: Colors.grey.shade700,
                  ),
                  Text(
                    "75",
                    style: TextStyle(
                      fontSize: 72,
                      fontFamily: GoogleFonts.raleway().fontFamily,
                      fontWeight: FontWeight.w100,
                      color: Colors.grey.shade700,
                      height: 1,
                    ),
                  ),
                  Icon(
                    Icons.add_rounded,
                    size: 20,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "2650k",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w100,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: CustomPaint(
                            painter: Shot02ArcPainter(),
                          ),
                        ),
                        DotCircleShadowed(
                          width: MediaQuery.of(context).size.width * 0.8 - 90,
                          shadow: false,
                          color: Colors.white,
                          hasBorder: false,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.color,
    required this.width,
  }) : super(key: key);
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class DotCircleShadowed extends StatelessWidget {
  const DotCircleShadowed({
    Key? key,
    required this.width,
    required this.shadow,
    required this.hasBorder,
    required this.color,
  }) : super(key: key);
  final double width;
  final bool shadow;
  final bool hasBorder;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      alignment: Alignment.center,
      padding: hasBorder ? const EdgeInsets.all(4) : null,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.white,
            Colors.grey.shade400,
          ],
          focalRadius: 0.35,
          radius: 1,
          focal: Alignment(0, 0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 5,
            spreadRadius: -1,
          ),
          BoxShadow(
            color: shadow ? Colors.white : Colors.transparent,
            offset: Offset(0, -5),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: false
          ? null
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    color,
                    Colors.grey.shade100,
                    color,
                  ],
                  stops: [0.75, 0.9, 1],
                  center: Alignment(0, 0.07),
                  focal: Alignment.center,
                ),
              ),
            ),
    );
  }
}

class Shot02ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width;
    var h = size.height;
    var centerX = w / 2;
    var centerY = h / 2;
    var center = Offset(centerX, centerY);
    var radius = max(centerY, centerX);
    var paintArcBottom = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 6;
    var paintArc = Paint()
      ..color = Shot02().primaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 6;
    var dashLines = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    for (var i = 13; i < 42; i++) {
      canvas.drawLine(
        Offset(
          centerX + (radius - 8) * cos(i * 10 * pi / 180),
          centerY + (radius - 8) * sin(i * 10 * pi / 180),
        ),

        /// add only - pi/4 to get fancy circle
        Offset(
          centerX + radius * cos(i * 10 * pi / 180),
          centerY + radius * sin(i * 10 * pi / 180),
        ),
        dashLines,
      );
    }
    canvas.drawArc(
      new Rect.fromCircle(center: center, radius: radius - 16),
      0,
      2 * pi,
      false,
      paintArcBottom,
    );
    canvas.drawArc(
      new Rect.fromCircle(center: center, radius: radius - 16),
      13 * 10 * pi / 180,
      20 * 10 * pi / 180,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
