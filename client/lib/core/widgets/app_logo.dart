import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


/// A widget that displays the IronTrack logo with customizable styling.
/// 
/// The logo consists of "Iron Track" text split with a rotated dumbbell icon
/// in the brand's primary color.
/// 
class AppLogo extends StatelessWidget {

  static const double _defaultIconSize = 32.0;
  static const double _rotationAngle = -pi / 6;

  final double? iconSize;
  final TextStyle? textStyle;

  const AppLogo({
    super.key,
    this.iconSize = _defaultIconSize,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle = textStyle ?? Theme.of(context).textTheme.displayLarge;
    final primaryColor = Theme.of(context).colorScheme.primary;

    if (effectiveTextStyle == null) {
      throw FlutterError(
        'No text style found. Either provide a textStyle or ensure a Theme is present.',
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText('I', 'ron', effectiveTextStyle, primaryColor),
        Transform.rotate(
          angle: _rotationAngle,
          child: FaIcon(
            FontAwesomeIcons.dumbbell,
            color: primaryColor,
            size: iconSize,
            semanticLabel: 'IronTrack logo dumbbell',
          ),
        ),
        _buildText('T', 'rack', effectiveTextStyle, primaryColor),
      ],
    );
  }

  Widget _buildText(
    String highlighted,
    String regular,
    TextStyle style,
    Color highlightColor,
  ) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: highlighted,
            style: style.copyWith(color: highlightColor),
          ),
          TextSpan(
            text: regular,
            style: style,
          ),
        ],
      ),
    );
  }
}