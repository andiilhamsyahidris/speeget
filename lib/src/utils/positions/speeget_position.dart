import 'package:speeget/speegets.dart';

/// Utility class. Don't try to use it!
///
/// This contains a custom position for the [Speeget]

class SpeegetPosition {
  /// Distance to the top side of a parent widget.
  final double? top;

  /// Distance to the end side of a parent widget.
  final double? end;

  /// Distance to the start side of a parent widget.
  final double? start;

  /// Distance to the bottom side of a parent widget.
  final double? bottom;

  const SpeegetPosition._({this.top, this.bottom, this.start, this.end});

  /// Factory method that creates a new instance of this widget
  /// according to [top] and [start]
  factory SpeegetPosition.topStart({double top = -5, double start = -10}) {
    return SpeegetPosition._(top: top, start: start);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [top] and [end]
  factory SpeegetPosition.topEnd({double top = -8, double end = -10}) {
    return SpeegetPosition._(top: top, end: end);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [bottom] and [end]
  factory SpeegetPosition.bottomEnd({double bottom = -8, double end = -10}) {
    return SpeegetPosition._(bottom: bottom, end: end);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [bottom] and [start]
  factory SpeegetPosition.bottomStart(
      {double bottom = -8, double start = -10}) {
    return SpeegetPosition._(bottom: bottom, start: start);
  }
}
