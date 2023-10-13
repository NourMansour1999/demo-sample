import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

class BuildDrawerHeader extends StatefulWidget {
  const BuildDrawerHeader({super.key});

  @override
  _BuildDrawerHeaderState createState() => _BuildDrawerHeaderState();
}

class _BuildDrawerHeaderState extends State<BuildDrawerHeader> {
  ///  profile data
  ProfileMockData _profileMockData =ProfileMockData();
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...[
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                _profileMockData.profileImage!,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 110,
                      child: Text( _profileMockData.profileName!,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          style: buttonTextDarkBgStyle),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.verified, color: primaryColor),
                  ],
                ),
                buildButton(),
              ],
            ),
            ].expand((element) => [const SizedBox(width: 4,),element])
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.5,
          backgroundColor: whiteColor,
          shadowColor: whiteColor.withOpacity(0.25),
          minimumSize: const Size(80, 40), // full width and 50 height
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...[
              const CircleAvatar(
                radius: 10,
                backgroundColor: secondaryColor,
              ),
              Text( _profileMockData.profileRole!,
                  overflow: TextOverflow.clip,
                  style: buttonTextWhiteBgStyle)
            ].expand((element) => [const SizedBox(width: 8), element])
          ],
        ),
      ),
    );
  }
}

class ProfileMockData {
  String? profileName;
  String? profileRole;
  String? profileImage;

  ProfileMockData({this.profileName, this.profileImage, this.profileRole}) {
    profileName = "Rima Dardar";
    profileImage =
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
    profileRole = "Manager";
  }
}
