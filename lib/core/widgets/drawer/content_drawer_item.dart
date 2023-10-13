import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///model for drawer item
class ContentDrawerItem {
  final IconData? icon; ///may need to use icon url
  final String? title;
  final Color? itemColor;
  final Widget? bodyTrailing; ///widget at the trailing of the drawer item
  final TextStyle? titleStyle;
  final Widget? component; ///to import custom component as drawer item
  final List<ContentDrawerItem>? children; ///when drawer item has another list of items (similar to settings)
  final bool? clickable;
  final double? sizeIcon;

  final dynamic path; ///for navigation
  const ContentDrawerItem(
      {this.icon,
        this.sizeIcon,
        this.title,
        this.itemColor = secondaryColor,
        this.bodyTrailing,
        this.titleStyle,
        this.component,
        this.children,
        this.clickable = true,this.path});
}
