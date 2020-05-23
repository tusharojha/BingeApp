import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appLogo({height}) {
  final String assetName = 'assets/logo/logo.svg';
  return SvgPicture.asset(assetName,
      height: height, semanticsLabel: 'Binge Logo');
}
