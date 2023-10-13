import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:echo_cash/core/utils/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:echo_cash/core/widgets/drawer/build_drawer_header.dart';
import 'package:echo_cash/core/widgets/drawer/change_language.dart';
import 'package:echo_cash/core/widgets/drawer/content_drawer_item.dart';
import 'package:echo_cash/core/widgets/drawer/custom_switch.dart';
import 'package:echo_cash/core/widgets/drawer/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoggedInCustomDrawer extends StatefulWidget {
  const LoggedInCustomDrawer({super.key});

  @override
  State<LoggedInCustomDrawer> createState() => _LoggedInCustomDrawerState();
}

class _LoggedInCustomDrawerState extends State<LoggedInCustomDrawer> {
  List<ContentDrawerItem>? currentList; /// the list to be viewed in the drawer (main list or children list)
  List<ContentDrawerItem>? _drawerItemsList; /// initial drawer list content

  @override
  void initState() {
    // TODO: implement initState
    fillList();
    currentList = _drawerItemsList;
    super.initState();
  }

 void fillList() {
    _drawerItemsList = [
      ContentDrawerItem(
        title: 'home'.tr(),
        icon: Icons.home,
      ),
      ContentDrawerItem(
        title: 'wallets'.tr(),
        icon: Icons.wallet,
      ),
      ContentDrawerItem(
        title: 'my_profile'.tr(),
        icon: Icons.person,
      ),
      ContentDrawerItem(
        title: 'change_pin'.tr(),
        icon: Icons.lock,
      ),
      ContentDrawerItem(
        title: 'notifications'.tr(),
        icon: Icons.notifications,
      ),
      ContentDrawerItem(
        title: 'settings'.tr(),
        icon: Icons.settings,
        bodyTrailing: Icon(
          Icons.arrow_forward_ios,
          color: secondaryColor.withOpacity(0.3),
          size: 15,
        ),
        children: [
          ContentDrawerItem(
            title: "back".tr(),
            icon: Icons.arrow_back_ios_sharp,
            sizeIcon: 15
          ),
          ContentDrawerItem(
              clickable: false,
              title: 'allow_notifications'.tr(),
              bodyTrailing: CustomSwitch(
                initValue: AppSharedPreferences.allowNotification,
                onTap: (value) {
                  setState(() {
                    AppSharedPreferences.allowNotification = value;
                  });
                },
              )),
          ContentDrawerItem(
              clickable: false,
              title: 'dark_mode'.tr(),
              bodyTrailing: CustomSwitch(
                initValue: AppSharedPreferences.darkMode,
                onTap: (value) {
                  setState(() {
                    print(AppSharedPreferences.darkMode);
                    AppSharedPreferences.darkMode = value;
                  });
                },
              )),
          ContentDrawerItem(component: ChangeLanguage()),
        ],
      )
    ];
  }

  /// To switch between main drawer items list and children list
  void UpdateList(List<ContentDrawerItem>? list) {
    setState(() {
      currentList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_drawerItemsList != null) fillList();

    return Drawer(
      child: SafeArea(
        child: Scaffold(
          body: Column(children: <Widget>[
            const BuildDrawerHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: currentList!.length,
                itemBuilder: (context, index) {
                  /// to show custom component or build a basic drawer item
                  if (currentList![index].component == null) {
                    return DrawerItem(
                      model: currentList![index],
                      onTap: currentList![index].clickable!
                          ? () {
                        /// show children list in drawer (when an item with children is tapped)
                              if (currentList![index].children != null) {
                                setState(() {
                                  UpdateList(currentList![index].children);
                                });
                              }
                              /// Add back button if children list in view
                              else if (currentList![index].title ==
                                  "back".tr()) {
                                setState(() {
                                  UpdateList(_drawerItemsList);
                                });
                              }
                            }
                          : null,
                    );
                  } else {
                    /// return custom component
                    return currentList![index].component;
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              /// lower section of the drawer
              child: Column(
                children: [
                  DrawerItem(
                    onTap: () {},
                    model: ContentDrawerItem(
                      title: 'help'.tr(),
                      icon: Icons.help,
                    ),
                  ),
                  DrawerItem(
                    onTap: () {},
                    model: ContentDrawerItem(
                      title: 'logout'.tr(),
                      icon: Icons.logout,
                      itemColor: redColor,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
