// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'package:mygovern/Core/Constant/textcontroller.dart';

import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Logic/Provider/userData_provider.dart';
import '../../Logic/Services/firestore/auth_services/auth_service.dart';
import '../Splash_Screen/Splash/splashscreen.dart';

class SignInpage extends StatefulWidget {
  const SignInpage({Key? key}) : super(key: key);

  @override
  State<SignInpage> createState() => _SignInpageState();
}

class _SignInpageState extends State<SignInpage> {
  late AuthService authService;
  bool showLoading = false;
  bool showAlert = false;
  bool ispasswordvisible = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);
    final userDataProvider = Provider.of<UsereDataProvider>(context);
    return Form(
      key: _formkey,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 30),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                        height: 70,
                        width: 325,
                        child: TextFormField(
                          controller: emailController,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        )),
                    const SizedBox(height: 30),
                    SizedBox(
                        height: 70,
                        width: 325,
                        child: TextFormField(
                          controller: passwordController,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                          obscureText: ispasswordvisible,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Password";
                            } else if (value.length < 6) {
                              return "Password length must be 6";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              icon: ispasswordvisible
                                  ? const Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                      color: Colors.white54,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                              onPressed: () => setState(
                                  () => ispasswordvisible = !ispasswordvisible),
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, ForgotpassScreenRoute);
                              },
                              child: const Text(
                                "Forgot your password?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ]),
                    ),
                    Container(
                      width: 325,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                          color: Colors.black45),
                      child: TextButton(
                        onPressed: () async {
                          setState(() {
                            showLoading = true;
                          });
                          progressIndicater(context, showLoading = true);

                          await login();

                          showAlert == true
                              ? null
                              : progressIndicater(context, showLoading = false);
                          emailController.clear();
                          passwordController.clear();
                          // Navigator.pushNamed(context, homepageScreenRoute);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 325,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                          color: Colors.black45),
                      child: TextButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, signUpScreenRoute);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          " Or Connect Using ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: OutlinedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50)),
                        onPressed: () async {
                          bool val = await userDataProvider.signInWithGoogle();
                          // await GoogleSignIn().signIn();
                          if (val)
                            Navigator.pushNamed(context, homepageScreenRoute);
                        },
                        icon: SizedBox(
                          height: 25,
                          child: Image.asset('assets/images/google.png'),
                        ),
                        label: const Text("Google SignIn"),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: OutlinedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50)),
                        onPressed: () async {
                          // bool val = await userDataProvider.signInWithGoogle();
                          // await GoogleSignIn().signIn();
                          // if (val)
                          Navigator.pushNamed(context, NumberauthScreenRoute);
                        },
                        icon: SizedBox(
                          height: 25,
                          child: Image.asset('assets/images/phoneicon.png'),
                        ),
                        label: const Text("Phone signIn"),
                      ),
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

  Future<dynamic>? progressIndicater(BuildContext context, showLoading) {
    if (showLoading == true) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
    } else {
      return null;
    }
  }

  login() async {
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text.toString(), passwordController.text.toString());

      Navigator.pushNamedAndRemoveUntil(
          context, homepageScreenRoute, (route) => false);
    } catch (e) {
      return alertBox(context, e);
    }
  }

  Future<void> alertBox(BuildContext context, e) {
    setState(() {
      showLoading = false;
      showAlert = true;
    });
    return Alert(
      context: context,
      title: "ALERT",
      desc: e.toString(),
    ).show();
  }
}
