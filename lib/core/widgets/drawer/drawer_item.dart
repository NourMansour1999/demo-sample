import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:echo_cash/core/widgets/drawer/content_drawer_item.dart';
import 'package:flutter/material.dart';
///build drawer item from drawer item object
class DrawerItem extends StatelessWidget {
  final GestureTapCallback? onTap;
  final ContentDrawerItem? model;
  const DrawerItem({
  super.key,
  this.onTap,
  this.model,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            onTap: onTap,
            isThreeLine: false,
            minLeadingWidth: 10,
            leading: model!.icon != null
                ? Icon(
              model!.icon,
              color: model!.itemColor!.withOpacity(0.3),
              size: model!.sizeIcon??25,
            )
                : Container(width: 10),
            title: Text(
              model!.title!,
              style: buttonTextWhiteBgStyle.copyWith(color: model!.itemColor),
            ),
            trailing: model!.bodyTrailing,
          ),
        ),
        const Divider(
          color: greyColor,
          thickness: 0.5,
        )
      ],
    );
  }
}