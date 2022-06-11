import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Shot_01 constants
class Shot01 {
  static Color _primaryColor = Colors.deepPurple.shade300;
  static Color _bgColor = Color(0xFFE6F0FF);
  Color get primaryColor => _primaryColor;
  Color get bgColor => _bgColor;
  List<BarChartGroupData>? data = [
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(y: 7, width: 20, colors: [_primaryColor]),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(y: 5, width: 20, colors: [_primaryColor]),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(y: 7, width: 20, colors: [_primaryColor]),
      ],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(y: 10, width: 20, colors: [_primaryColor]),
      ],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(y: 6, width: 20, colors: [_primaryColor]),
      ],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(y: 5, width: 20, colors: [_primaryColor]),
      ],
    ),
    BarChartGroupData(
      x: 7,
      barRods: [
        BarChartRodData(y: 10, width: 20, colors: [_primaryColor]),
      ],
    ),
  ];
}
