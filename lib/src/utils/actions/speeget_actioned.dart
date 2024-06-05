import 'package:flutter/material.dart';
import 'package:speeget/src/utils/actions/speeget_action.dart';

/// Utility class. Don't try to use it!
///
/// This is just a comfortable wrap for [InkWell],
/// [SpeegetAction] and [child].
///
///
class SpeegetActioned extends StatelessWidget {
  /// Specifies speeget action according to [child]
  final SpeegetAction? action;

  /// It is a child that will be a displayed according to [positioned]
  final Widget child;

  const SpeegetActioned({super.key, required this.child, this.action});

  @override
  Widget build(BuildContext context) {
    final action = this.action;

    if (action == null) {
      return InkWell(
        onTap: () => SpeegetAction.onTap(() => null),
      );
    }

    return InkWell(
      onLongPress: () => SpeegetAction.onLongPress(() => null),
    );
  }
}
