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
  static const double _defaultSpacing = 16.0; 

  final double iconSize;
  final double spacing;
  final TextStyle? textStyle;
  final String semanticsLabel;
  final bool withIcon;
  final MainAxisAlignment alignment;

  const AppLogo({
    super.key,
    this.withIcon = true,
    this.iconSize = _defaultIconSize,
    this.spacing = _defaultSpacing, 
    this.textStyle,
    this.semanticsLabel = 'IronTrack Logo',
    this.alignment =  MainAxisAlignment.spaceBetween,
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

    return Semantics(
      label: semanticsLabel,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          _buildText('I', 'ron', effectiveTextStyle, primaryColor),
          if (withIcon) Transform.rotate(
              angle: _rotationAngle,
              child: FaIcon(
                FontAwesomeIcons.dumbbell,
                color: primaryColor,
                size: iconSize,
                semanticLabel: 'IronTrack logo dumbbell',
              ),
            )
          else SizedBox(width: spacing),
          _buildText('T', 'rack', effectiveTextStyle, primaryColor),
        ],
      ),
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
