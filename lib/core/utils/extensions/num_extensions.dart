import 'package:flutter/material.dart';

/// Num extension methods
extension NumExtension on num {
  /// Convert to Duration in milliseconds
  Duration get milliseconds => Duration(milliseconds: toInt());

  /// Convert to Duration in seconds
  Duration get seconds => Duration(seconds: toInt());

  /// Convert to Duration in minutes
  Duration get minutes => Duration(minutes: toInt());

  /// Convert to Duration in hours
  Duration get hours => Duration(hours: toInt());

  /// Convert to Duration in days
  Duration get days => Duration(days: toInt());

  /// Convert to SizedBox with width
  SizedBox get width => SizedBox(width: toDouble());

  /// Convert to SizedBox with height
  SizedBox get height => SizedBox(height: toDouble());

  /// Convert to SizedBox with both width and height
  SizedBox get square => SizedBox(
        width: toDouble(),
        height: toDouble(),
      );

  /// Convert to EdgeInsets horizontal
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: toDouble());

  /// Convert to EdgeInsets vertical
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());

  /// Convert to EdgeInsets all
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());

  /// Convert to EdgeInsets only left
  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());

  /// Convert to EdgeInsets only right
  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());

  /// Convert to EdgeInsets only top
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());

  /// Convert to EdgeInsets only bottom
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());

  /// Convert to Radius
  Radius get radius => Radius.circular(toDouble());

  /// Convert to BorderRadius circular
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  /// Clamp between min and max
  num clampRange(num min, num max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }

  /// Check if number is between min and max (inclusive)
  bool isBetween(num min, num max) {
    return this >= min && this <= max;
  }
}
