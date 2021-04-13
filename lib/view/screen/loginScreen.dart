import 'package:delivery/service/multiLanguageService/app_localization.dart';
import 'package:delivery/utils/constants.dart';
import 'package:delivery/view/component/CustomButton.dart';
import 'package:delivery/viewmodel/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../component/CustomTextField.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authViewModel = Provider.of<AuthViewModel>(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/biker.svg"),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFiled(
                      screenSize: screenSize,
                      hintText: "Email",
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    CustomTextFiled(
                      screenSize: screenSize,
                      hintText:
                          AppLocalizations.of(context).translate("Password"),
                      isForPasword: true,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.84,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate("forgot_password?")
                                  .toString(),
                              style: TextStyle(
                                color: kGrey.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              print("Forgot password");
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      text: AppLocalizations.of(context).translate("login"),
                      role: () async {
                        await authViewModel
                            .login(emailController.text.trim(),
                                passwordController.text.trim())
                            .then((value) {
                          if (value.trim() == "successful login") {
                            Navigator.pushNamed(context, "/getStartedScreen");
                          } else {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("Invalid email or password")));
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)
                              .translate("don't_have_an_account_?"),
                          style: TextStyle(
                            color: kGrey.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            " " +
                                AppLocalizations.of(context)
                                    .translate("Register_now"),
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            print("Register now");
                          },
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
