import 'package:flutter/material.dart';
import 'package:speeget/speegets.dart';
import 'package:speeget/src/utils/actions/speeget_action.dart';
import 'package:speeget/src/utils/actions/speeget_actioned.dart';
import 'package:speeget/src/utils/positions/speeget_position.dart';
import 'package:speeget/src/utils/positions/speeget_positioned.dart';

/// [child] defines an area t

@immutable
class Speeget extends StatefulWidget {
  final Widget child;
  final String text;
  final SpeegetPosition? iconPosition;
  final Color iconColor;
  final bool enabledIcon;
  final SpeegetAction actionPress;

  const Speeget({
    super.key,
    required this.child,
    required this.text,
    required this.actionPress,
    this.iconPosition,
    this.iconColor = Colors.grey,
    this.enabledIcon = true,
  });

  @override
  State<Speeget> createState() => _SpeegetState();
}

class _SpeegetState extends State<Speeget> {
  @override
  Widget build(BuildContext context) {
    return SpeegetActioned(
      action: widget.actionPress,
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
