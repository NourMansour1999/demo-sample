import 'dart:async';
import 'package:echo_cash/core/constants/Validators.dart';
import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:echo_cash/core/widgets/back_and_skip_button.dart';
import 'package:echo_cash/features/authentication/presentation/widgets/login/message_displayed_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: whiteColor,
        scrolledUnderElevation: 0,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: SkipAndBackButtonWidget(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: skipAndBackButtonStyleWhiteBg(),
                child: const Text("Back",
                    style: backAndSkipButtonTextWhiteBgStyle),
              ),
            ),
          )
        ],
      ),
      backgroundColor: whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, bottom: 30, top: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:  50),
                    MessageDisplayWidget(message: 'Email Already Exist'),
                    const Text("Create an Account", style: headingStyle),
                    const SizedBox(height: 10),
                    Text("please enter your details to create your account",
                        style: descriptionStyle),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      enabled: true,
                      decoration: customInputDecoration('Full Name',
                          isConnected: true),
                      validator: (value) => Validators.nameValidate(value!, context),

                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      enabled: true,
                      onChanged: (value) {
                        value = value.trim();
                      },
                      decoration: customInputDecoration("Email Address",
                          isConnected: true),
                        validator: (val)=> Validators.validateEmail(val!)

                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration("PIN",
                          isConnected: true),
                      validator: (val) => Validators.validatePassword(val!),

                      enabled: true ,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration("Confirm PIN",
                          isConnected: true),
                      validator: (value) => Validators.confirmPasswordValidate(
                          value!,
                          passwordController.text.trim() ,
                          context),

                      enabled: true,
                    ),
                    const SizedBox(height: 10),
                    CheckboxListTile(
                      title: const Text(
                          'I confirm that I have read agreed to the',
                          style: textStyle1DarkGrey),
                      subtitle: const Row(
                        children: [
                          Text('User Agreement', style: textStyle1Secondary),
                          Text(' and ', style: textStyle1DarkGrey),
                          Text('Privacy Policy', style: textStyle1Secondary)
                        ],
                      ),
                      checkColor: Colors.white,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => primaryColor),
                      value: false,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: null,
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Validate the current form state.
                              if (_formKey.currentState!.validate()) {
//                                Navigator.of(context).pushNamed(
//                                    'successfull-screen',
//                                    arguments: {
//                                      'title': 'Regsiter Successfully',
//                                      'subtitle':
//                                          'account created successfully',
//                                      'message':
//                                          'You can now login to your account',
//                                    });
                                Navigator.of(context).pushNamed(
                                    'successfull-screen',
                                    arguments: {
                                      'title': 'Thank you for Registering',
                                      'subtitle':
                                          'A verification link has been sent to your email',
                                      'message':
                                          'Please sign in to your email to verify your account',
                                    });
                              }
                            },
                            style: buttonStyleDarkBg(),
                            child: const Text('Create an Account',
                                style: buttonTextDarkBgStyle),
                          ),
                        ),
                        const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account? ',
                                style: textStyle1DarkGrey),
                            GestureDetector(
                              child: const Text('Log in',
                                  style: textStyle1Secondary),
                              onTap: () {
                                Navigator.of(context).pushNamed('login');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
