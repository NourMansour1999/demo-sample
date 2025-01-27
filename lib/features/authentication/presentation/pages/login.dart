import 'dart:async';
import 'package:echo_cash/core/constants/Validators.dart';
import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:echo_cash/core/widgets/guest_drawer_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('notifications');
            },
            icon: const Icon(
              Icons.notifications,
            ),
          )
        ],
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding:
            const EdgeInsets.only(right: 30, left: 30, bottom: 30, top: 10),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(),
                    const Text("Welcome back", style: headingStyle),
                    const SizedBox(height: 10),
                    Text("Please enter your details to log in to your account.",
                        style: descriptionStyle),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: greyColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Text("Guest", style: textStyle2Black),
                                SizedBox(width: 5),
                                Icon(Icons.verified, color: primaryColor),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 135,
                              height: 29,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: greyColor),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, color: blackColor, size: 15),
                                  SizedBox(width: 5),
                                  Text("UI / UX Designer",
                                      style: textStyle1Black),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      enabled: true,
                      decoration: customInputDecoration("Email Address",
                          isConnected: true),
                      validator: (val)=> Validators.validateEmail(val!)

                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      decoration:
                          customInputDecoration("Password", isConnected: true),
                      validator: (val) => Validators.validatePassword(val!),
                      enabled: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Future.microtask(() {
                              Navigator.of(context)
                                  .pushNamed('forget-password');
                            });
                          },
                          child: const Text("Forgot your PIN ?",
                              style: textStyle1DarkGrey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: buttonStyleDarkBg(),
                      onPressed: () async {
                        // Validate the current form state.
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacementNamed('home');
                        }
                      },
                      child: const Text('Login', style: buttonTextDarkBgStyle),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const GuestCustomDrawer(),
    );
  }
}
