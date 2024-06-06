import 'package:flutter/material.dart';
import 'package:speeget/src/utils/positions/speeget_position.dart';

/// Utility class. Don't try to use it!
///
/// This is just a comfortable wrap for [PositionedDirectional],
/// [SpeegetPosition] and [child].
///

class SpeegetPositioned extends StatelessWidget {
  /// Specifies icon position according to [child]
  final SpeegetPosition? position;

  /// it is a [child] that will be displayed according to [positioned]
  final Widget child;

  const SpeegetPositioned({super.key, required this.child, this.position});

  @override
  Widget build(BuildContext context) {
    final position = this.position;
    if (position == null) {
      final topEnd = SpeegetPosition.topEnd();
      return PositionedDirectional(
        top: topEnd.top,
        end: topEnd.end,
        child: child,
      );
    }
    return PositionedDirectional(
      top: position.top,
      end: position.end,
      bottom: position.bottom,
      start: position.start,
      child: child,
    );
  }
}
