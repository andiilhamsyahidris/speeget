import 'package:speeget/speegets.dart';

/// Utility class. Don't try to use it!
///
/// This contains a custom position for the [Speeget]

class SpeegetAction {
  /// Action to trigger sound on the widget
  final Function? onTap;

  /// Action to trigger sound on the widget
  final Function? onLongPress;

  const SpeegetAction._({this.onTap, this.onLongPress});

  /// Factory method that creates a new instance of action on this widget
  /// according to [onTap] action
  factory SpeegetAction.onTap(Function()? onTap) {
    return SpeegetAction._(onTap: onTap);
  }

  /// Factory method that creates a new instance of action on this widget
  /// according to [onLongPress] action
  factory SpeegetAction.onLongPress(Function()? onLongPress) {
    return SpeegetAction._(onLongPress: onLongPress);
  }
}
