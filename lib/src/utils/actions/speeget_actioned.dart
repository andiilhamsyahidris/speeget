import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
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

  /// it is a flutter text to speech that will be using for enable voice on widget
  ///
  /// see also:
  /// * [FlutterTts]
  final FlutterTts? flutterTts;

  final String? text;

  const SpeegetActioned(
      {super.key,
      required this.child,
      this.action,
      this.flutterTts,
      this.text});

  @override
  Widget build(BuildContext context) {
    switch (action) {
      case SpeegetAction.onTap:
        return InkWell(
          onTap: () async {
            await flutterTts?.speak(text ?? '');
          },
        );
      case SpeegetAction.onLongPress:
        return InkWell(
          onLongPress: () async {
            await flutterTts?.speak(text ?? '');
          },
        );
      default:
        return Container();
    }
  }
}
