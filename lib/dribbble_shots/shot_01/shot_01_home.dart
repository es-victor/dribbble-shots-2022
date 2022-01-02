import 'dart:async';
import 'dart:math';

import 'package:dribbble_shots_2022/constants/constants.dart';
import 'package:dribbble_shots_2022/icon_fonts/icon_pack_bold_icons.dart';
import 'package:dribbble_shots_2022/icon_fonts/icon_pack_outline_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Shot01Home extends StatefulWidget {
  const Shot01Home({Key? key}) : super(key: key);

  @override
  _Shot01HomeState createState() => _Shot01HomeState();
}

class _Shot01HomeState extends State<Shot01Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Shot01().bgColor,
      appBar: AppBar(
        backgroundColor: Shot01().bgColor,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Container(
                height: 24,
                child: Image.asset(
                  "assets/images/shot_01_logo.png",
                  color: Shot01().primaryColor,
                ),
              ),
              Spacer(),
              Icon(
                IconPackOutline.calendar,
                color: Shot01().primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                "Average Sleep",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "7 hours last night",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              chart(),
              weekDays(),
              const SizedBox(
                height: 12,
              ),
              sleepWakeup(),
              Divider(
                height: 0,
                thickness: 0.5,
                color: Shot01().primaryColor.withOpacity(0.9),
              ),
              tomorrowMorning(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Other",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Divider(
                height: 0,
                thickness: 0.5,
                color: Shot01().primaryColor.withOpacity(0.9),
              ),
              alarmEveryDay(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Padding sleepWakeup() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 8,
      ),
      child: Row(
        children: [
          Text(
            "Sleep | Wake up",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return Material(elevation: 10, child: Shot01SecondScreen());
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(
                        Tween(begin: Offset(1, 0), end: Offset(0, 0))
                            .chain(CurveTween(curve: Curves.linear))),
                    child: child,
                  );
                }),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Shot01().primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding chart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 2.1,
        child: BarChart(
          BarChartData(
            borderData: FlBorderData(
              show: false,
            ),
            gridData: FlGridData(
              drawVerticalLine: false,
              drawHorizontalLine: false,
            ),
            backgroundColor: Colors.transparent,
            titlesData: FlTitlesData(show: false),
            axisTitleData: FlAxisTitleData(
              show: true,
              leftTitle: AxisTitle(margin: 10, reservedSize: 0100),
            ),
            barGroups: Shot01().data,
            alignment: BarChartAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }

  Container bottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Shot01().bgColor,
        boxShadow: [
          BoxShadow(
            color: Shot01().primaryColor.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: -10,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            IconPackOutline.home,
            size: 20,
            color: Colors.grey.shade600,
          ),
          Icon(
            IconPackOutline.alarm,
            size: 20,
            color: Shot01().primaryColor,
          ),
          Icon(
            IconPackOutline.stopwatch,
            size: 20,
            color: Colors.grey.shade600,
          ),
          Icon(
            IconPackOutline.user,
            size: 20,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }

  Padding alarmEveryDay() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "5:20 AM",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    "Alarm, every day",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Shot01().primaryColor,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4,
              ),
              width: 50,
              alignment: Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 20,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding tomorrowMorning() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Shot01().primaryColor.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: -10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "8:15 AM",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    "Tomorrow Morning",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Shot01().primaryColor,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Text(
                "Change",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row weekDays() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        alignment: Alignment.center,
        child: Text(
          "M",
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 12,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "T",
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 12,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "W",
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 12,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "T",
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 12,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "F",
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 12,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "S",
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 12,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "S",
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 12,
      ),
    ]);
  }
}

class Shot01SecondScreen extends StatefulWidget {
  const Shot01SecondScreen({Key? key}) : super(key: key);

  @override
  _Shot01SecondScreenState createState() => _Shot01SecondScreenState();
}

class _Shot01SecondScreenState extends State<Shot01SecondScreen>
    with TickerProviderStateMixin {
  late AnimationController _wakeUpController;
  late AnimationController _sleepController;
  late AnimationController _arcController;
  late Animation<double> _wakeUpAnimation;
  late Animation<double> _sleepAnimation;
  late Animation<double> _arcAnimation;
  @override
  void initState() {
    _wakeUpController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _sleepController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _arcController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _wakeUpAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      _wakeUpController,
    );
    _sleepAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      _sleepController,
    );
    _sleepController.value = 0.25;
    _wakeUpController.value = 0.9;
    _arcAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      _sleepController,
    );
    super.initState();
  }

  _onHorizontalDragStartSleep(DragStartDetails details) {
    setState(() {});
  }

  _onHorizontalDragUpdateSleep(DragUpdateDetails details) {
    var w = MediaQuery.of(context).size.width * 0.6;
    var center = Offset(w / 2, w / 2);
    double angle = 0.0;

    /// Get point around the circle
    var x = details.localPosition.dx - center.dx;
    var y = center.dy - details.localPosition.dy;

    /// Calculate angle basing on Quadrants
    if (x.isNegative || y.isNegative) {
      if (x.isNegative && y.isNegative) {
        angle = atan(y / x) + pi;
      } else if (x.isNegative) {
        angle = pi - atan(y / x).abs();
      } else {
        angle = 2 * pi - atan(y / x).abs();
      }
    } else {
      angle = atan(y / x);
    }
    setState(() {
      _sleepController.value = angle / (pi * 2);
      _arcController.value = 0.0;
    });
  }

  _onHorizontalDragEndSleep(DragEndDetails details) {}

  _onHorizontalDragStartWake(DragStartDetails details) {
    setState(() {});
  }

  _onHorizontalDragUpdateWake(DragUpdateDetails details) {
    var w = MediaQuery.of(context).size.width * 0.6;
    var center = Offset(w / 2, w / 2);
    double angle = 0.0;

    /// Get point around the circle
    var x = details.localPosition.dx - center.dx;
    var y = center.dy - details.localPosition.dy;

    /// Calculate angle basing on Quadrants
    if (x.isNegative || y.isNegative) {
      if (x.isNegative && y.isNegative) {
        angle = atan(y / x) + pi;
      } else if (x.isNegative) {
        angle = pi - atan(y / x).abs();
      } else {
        angle = 2 * pi - atan(y / x).abs();
      }
    } else {
      angle = atan(y / x);
    }
    setState(() {
      _wakeUpController.value = angle / (pi * 2);
      _arcController.value = 0.0;
    });
  }

  _onHorizontalDragEndWake(DragEndDetails details) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Shot01().bgColor,
      appBar: AppBar(
        backgroundColor: Shot01().bgColor,
        elevation: 0,
        // title: Text(
        //   "Sleep | Wake up",
        //   style: TextStyle(color: Colors.grey.shade800),
        // ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        iconTheme: IconThemeData(
          color: Shot01().primaryColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("Test");
            },
            icon: Icon(
              IconPackOutline.calendar,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.hardEdge,
              fit: StackFit.loose,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Shot01().bgColor, Shot01().primaryColor],
                        radius: 1,
                        focal: const Alignment(0, 0.06),
                        focalRadius: 0.44,
                      ),
                    ),
                  ),
                ),

                /// Arc stroke
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: AnimatedBuilder(
                    animation: _arcAnimation,
                    builder: (ctx, _) {
                      return CustomPaint(
                        painter: Shot01ArcPainter(
                          sleep: _sleepAnimation.value,
                          wakeUP: _wakeUpAnimation.value,
                        ),
                      );
                    },
                  ),
                ),

                /// Center circle
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: -10,
                        blurRadius: 45,
                        offset: const Offset(0, 10),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade200,
                        Shot01().bgColor,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: ClockWidget(),
                ),

                /// Sleep bed
                Positioned.fill(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: GestureDetector(
                        onHorizontalDragStart: _onHorizontalDragStartSleep,
                        onHorizontalDragUpdate: _onHorizontalDragUpdateSleep,
                        onHorizontalDragEnd: _onHorizontalDragEndSleep,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _sleepAnimation,
                            builder: (ctx, child) {
                              return Transform(
                                transform: Matrix4.identity()
                                  ..rotateZ(
                                      2 * pi * (1 - _sleepAnimation.value))
                                  ..translate(
                                      (MediaQuery.of(context).size.width *
                                              0.6) /
                                          2),
                                alignment: Alignment.center,
                                child: Transform.rotate(
                                  angle: -2 * pi * (1 - _sleepAnimation.value),
                                  alignment: Alignment.center,
                                  child: child,
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(2),
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.bed_rounded,
                                size: 20,
                                color: Shot01().primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Wake up bell alert
                Positioned.fill(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: GestureDetector(
                        onHorizontalDragStart: _onHorizontalDragStartWake,
                        onHorizontalDragUpdate: _onHorizontalDragUpdateWake,
                        onHorizontalDragEnd: _onHorizontalDragEndWake,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _wakeUpAnimation,
                            builder: (ctx, child) {
                              return Transform(
                                transform: Matrix4.identity()
                                  ..rotateZ(
                                      2 * pi * (1 - _wakeUpAnimation.value))
                                  ..translate(
                                      (MediaQuery.of(context).size.width *
                                              0.6) /
                                          2),
                                alignment: Alignment.center,
                                child: Transform.rotate(
                                  angle: -2 * pi * (1 - _wakeUpAnimation.value),
                                  alignment: Alignment.center,
                                  child: child,
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(2),
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                IconPackOutline.bell,
                                size: 20,
                                color: Shot01().primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// How long sleeping
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              children: [
                Text(
                  "12 hr 15 min",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "This schedule does not meet your sleep goal",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: timeCard(
                    icon: Icons.bed_rounded,
                    text: "Bedtime",
                    time: "1:00 AM",
                    desc: "Tomorrow",
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Flexible(
                  flex: 1,
                  child: timeCard(
                      icon: IconPackOutline.bell,
                      text: "Wake up",
                      time: "8:15 AM",
                      desc: "Tomorrow"),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: MaterialButton(
              color: Shot01().primaryColor,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              minWidth: double.infinity,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () {},
              child: Text(
                "Edit sleep schedule in  health",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container timeCard(
      {required IconData icon,
      required String text,
      required String time,
      required String desc}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Shot01().primaryColor,
            size: 24,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}

class ClockWidget extends StatefulWidget {
  const ClockWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: CustomPaint(
        painter: ClockCustomPainter(),
      ),
    );
  }
}

class Shot01ArcPainter extends CustomPainter {
  final double sleep;
  final double wakeUP;
  Shot01ArcPainter({
    required this.sleep,
    required this.wakeUP,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width;
    var h = size.height;
    var centerX = w / 2;
    var centerY = h / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerY, centerX);
    var paintArc = Paint()
      ..color = Shot01().primaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 38;
    canvas.drawArc(
      new Rect.fromCircle(center: center, radius: radius),
      2 * pi * (1 - sleep),
      (wakeUP - sleep).isNegative
          ? ((wakeUP - sleep).abs()) * 2 * pi
          : (1 - (wakeUP - sleep).abs()) * 2 * pi,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ClockCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var time = DateTime.now();
    var second = time.second;
    var minute = time.minute;
    hourToTwelveHour(int hour) {
      if (hour > 12) {
        return hour - 12;
      }
      if (hour == 0) {
        return 12;
      }
      return hour;
    }

    var hour = hourToTwelveHour(time.hour);
    var w = size.width;
    var h = size.height;
    var centerX = w / 2;
    var centerY = h / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerY, centerX);

    /// paint circles
    var outerCirclePaint = Paint()..color = Colors.transparent;
    var innerCirclePaint = Paint()..color = Colors.transparent;
    var innerSmallCirclePaint = Paint()..color = Colors.grey.shade100;

    /// paint hands
    var minuteHand = Paint()
      ..color = Shot01().primaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    var hourHand = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    var dashLines = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    var dashLinesHeavy = Paint()
      ..color = Colors.deepOrange.shade500
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    var dashLinesHeavyMinute = Paint()
      ..color = Shot01().primaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    canvas.drawCircle(center, radius / 1.2, outerCirclePaint);
    canvas.drawCircle(center, radius / 2, innerCirclePaint);
    canvas.drawLine(
        center,
        Offset(centerX + 30 * cos((hour + minute / 60) * 30 * pi / 180),
            centerY + 30 * sin((hour + minute / 60) * 30 * pi / 180)),
        hourHand);
    canvas.drawLine(
        center,
        Offset(centerX + 45 * cos(minute * 6 * pi / 180),
            centerY + 45 * sin(minute * 6 * pi / 180)),
        minuteHand);

    canvas.drawCircle(center, 8, innerSmallCirclePaint);
    for (var i = 0; i < 60; i++) {
      canvas.drawLine(
        Offset(
          centerX + (radius - 2) * cos(i * 6 * pi / 180),
          centerY + (radius - 2) * sin(i * 6 * pi / 180),
        ),
        Offset(centerX + radius * cos(i * 6 * pi / 180),
            centerY + radius * sin(i * 6 * pi / 180)),
        (i == second)
            ? dashLinesHeavy
            : (i == minute)
                ? dashLinesHeavyMinute
                : dashLines,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
