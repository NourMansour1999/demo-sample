import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const CustomExpansionTile(
      {Key? key, required this.children, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
          initiallyExpanded: false,
          tilePadding: EdgeInsets.symmetric(horizontal: 16),
          childrenPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: buttonTextWhiteBgStyle,
          ),
          children: children),
    );
  }
}