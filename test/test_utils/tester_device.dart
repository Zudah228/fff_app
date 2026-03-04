import 'package:flutter/material.dart';

const testerDevices = [
  TesterDevice.iPhone14(),
  TesterDevice.iPhoneSE3(),
];

@immutable
class TesterDevice {
  const TesterDevice({required this.size, required this.name});

  const TesterDevice.iPhone14()
    : name = 'iPhone 14',
      size = const Size(390, 844);

  const TesterDevice.iPhoneSE3()
    : name = 'iPhone SE 3rd generation',
      size = const Size(375, 667);

  final Size size;
  final String name;

  String get fileNameSuffix => name.replaceAll(' ', '_').toLowerCase();
}
