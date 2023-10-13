import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final ValueChanged<bool?>? onTap;
  final bool? initValue;
  const CustomSwitch({super.key, this.onTap, this.initValue});
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool? _isSelected;
  @override
  void initState() {
    // TODO: implement initState
    _isSelected = widget.initValue??false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.scale(
        scale: 0.5,
        child: CupertinoSwitch(
          value: _isSelected!,
          activeColor: primaryColor,
          onChanged: (bool value) {
            setState(() {
              _isSelected = value;
              widget.onTap!(_isSelected);
            });
          },
        ),
      ),
    );
  }
}