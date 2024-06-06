import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speeget/speegets.dart';

@immutable
class Speeget extends StatefulWidget {
  /// Specifies [text] that will be using for speech
  final String text;

  /// Allows to set icon position according to [child]
  final SpeegetPosition? iconPosition;

  /// Specifies color that will be using in icon
  /// The default color is Grey
  final Color iconColor;

  /// Allows you to hide or show icon
  /// The default value is true
  final bool enabledIcon;

  /// Will be called when you tap or long press on the [child]
  final SpeegetAction actionPress;

  /// Specifies language that will be using in [speegets.Speeget] widget
  /// The default value is SpeegetLanguage.enUS
  final SpeegetLanguage? lang;

  /// The speeget [child] that will be displayed
  final Widget child;

  const Speeget({
    super.key,
    required this.text,
    required this.actionPress,
    required this.child,
    this.iconPosition,
    this.iconColor = Colors.grey,
    this.enabledIcon = true,
    this.lang = SpeegetLanguage.enUS,
  });

  @override
  State<Speeget> createState() => _SpeegetState();
}

class _SpeegetState extends State<Speeget> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();

    /// Initialize [FlutterTts]
    ///
    ///  see also:
    /// * [FlutterTts]
    flutterTts = FlutterTts();

    /// Set flutterTts language
    /// Default value is SpeegetLanguage.enUS
    flutterTts.setLanguage(_getLanguage());

    /// Set volume
    /// Allowed values are in the range from 0.0 (silent) to 1.0 (loudest)
    flutterTts.setVolume(0.5);

    /// Set pitch
    /// Default value is 1.0 and ranges from .5 to 2.0
    flutterTts.setPitch(1.0);

    /// Set speech rate
    /// Allowed values are in the range from 0.0 (slowest) to 1.0 (fastest)
    flutterTts.setSpeechRate(0.5);
  }

  String _getLanguage() {
    switch (widget.lang) {
      case SpeegetLanguage.enUS:
        return 'en-US';
      case SpeegetLanguage.enAU:
        return 'en-AU';
      case SpeegetLanguage.id:
        return 'id';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SpeegetActioned(
      action: widget.actionPress,
      flutterTts: flutterTts,
      text: widget.text,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: widget.child,
          ),
          SpeegetPositioned(
            position: widget.iconPosition,
            child: widget.enabledIcon
                ? Icon(
                    Icons.campaign,
                    color: widget.iconColor,
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
