import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:echo_cash/core/utils/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:echo_cash/core/widgets/drawer/content_drawer_item.dart';
import 'package:echo_cash/core/widgets/drawer/custom_expansion_tile.dart';
import 'package:echo_cash/core/widgets/drawer/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}
///create an expandable widget for languages using ExpansionTile library
class _ChangeLanguageState extends State<ChangeLanguage> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return _buildCustomExpansionTile(context);
  }

  Widget _buildCustomExpansionTile(BuildContext context) {
    dropdownValue = context.locale.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CustomExpansionTile(
        title: dropdownValue!.tr(),
        children: languages.keys.toList().map<DrawerItem>((String value) {
          return DrawerItem(
            model: ContentDrawerItem(
                title: value.tr(),
                itemColor: dropdownValue == value?primaryColor:null
            ),
            onTap:dropdownValue != value? () {
              dropdownValue = value;
              context.setLocale(languages[value]!);
              AppSharedPreferences.lang = value;
              Phoenix.rebirth(context);
            }:null,
          );
        }).toList(),
      ),
    );
  }
}
