import 'package:echo_cash/core/constants/app_assets.dart';
import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../constants/app_globals.dart';

class SuccessfullScreen extends StatelessWidget {
  final String title;

  final String subtitle;

  final String message;

  const SuccessfullScreen(
      {Key? key,
        required this.title,
        required this.subtitle,
        required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: whiteColor,
          shape: CircleBorder(),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('home');
          },
          child: const Icon(
            Icons.close_rounded,
            color:secondaryColor,
            size: 30,
          ),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                ///body
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    top: 370,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...[
                          Text(title,
                              style: headingStyle),
                          Text(subtitle,
                              style: buttonTextWhiteBgStyle.copyWith(fontWeight: FontWeight.w400, )),
                          Text(
                            message,
                            style: descriptionStyle,

                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(AppAssets.appLogo,
                                  width: 100)),
                        ].expand(
                              (element) => [
                            const SizedBox(
                              height: 32,
                            ),
                            element,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ClipPath(
                  clipper: SlopedClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...[
                          const Icon(Icons.done_outline,
                              color: whiteColor, size: 50),
                          const Text(
                            "Your account has been created",
                            style: buttonTextDarkBgStyle,
                          )
                        ].expand((element) => [
                          const SizedBox(
                            height: 32,
                          ),
                          element
                        ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SlopedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(SlopedClipper oldClipper) => false;
}
