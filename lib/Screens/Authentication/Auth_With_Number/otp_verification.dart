// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mygovern/Core/Constant/string.dart';
import '../../../Logic/Widgets/pin_input.dart';
import '../../../Logic/helper/helper.dart';
import '../../Splash_Screen/Splash/splashscreen.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  // final String Name;
  // final String Email;
  final String phoneNumber;

  const VerifyPhoneNumberScreen({
    // required this.Name,
    // required this.Email,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final _formkey = GlobalKey<FormState>();
    // TextEditingController phoneController = TextEditingController();
    // TextEditingController emailController = TextEditingController();
    // TextEditingController nameController = TextEditingController();
    // TextEditingController otpCodeController = TextEditingController();
    // final sp = context.read<SignInProvider>();
    // final ip = context.read<InternetProvider>();

    return SafeArea(
      child: FirebasePhoneAuthHandler(
        phoneNumber: widget.phoneNumber,
        signOutOnSuccessfulVerification: false,
        linkWithExistingUser: false,
        autoRetrievalTimeOutDuration: const Duration(seconds: 60),
        otpExpirationDuration: const Duration(seconds: 60),
        onCodeSent: () {
          log(otpverificationScreenRoute, msg: 'OTP sent!');
        },
        onLoginSuccess: (userCredential, autoVerified) async {
          log(
            otpverificationScreenRoute,
            msg: autoVerified
                ? 'OTP was fetched automatically!'
                : 'OTP was verified manually!',
          );

          ScaffoldMessenger.of(context).showSnackBar(animationsnackbar(
              "Sign In With Number",
              "Phone number verified successfully!",
              ContentType.success));

          log(
            otpverificationScreenRoute,
            msg: 'Login Success UID: ${userCredential.user?.uid}',
          );

          // Navigator.pushReplacement(context, homepageScreenRoute);
          Navigator.popAndPushNamed(context, homepageScreenRoute);
          // Navigator.pushReplacementNamed(context, homepageScreenRoute);
        },
        // ignore: void_checks
        onLoginFailed: (authException, stackTrace) {
          log(
            otpverificationScreenRoute,
            msg: authException.message,
            error: authException,
            stackTrace: stackTrace,
          );

          switch (authException.code) {
            case 'invalid-phone-number':
              // invalid phone number
              return ScaffoldMessenger.of(context).showSnackBar(
                  animationsnackbar("Sign In With Number",
                      "Invalid phone number!", ContentType.failure));
            case 'invalid-verification-code':
              // invalid otp entered
              return ScaffoldMessenger.of(context).showSnackBar(
                  animationsnackbar("Sign In With Number",
                      "The entered OTP is invalid!", ContentType.warning));

            // handle other error codes
            default:
              ScaffoldMessenger.of(context).showSnackBar(animationsnackbar(
                  "Sign In With Number",
                  "Something went wrong!",
                  ContentType.failure));

            // handle error further if needed
          }
        },
        onError: (error, stackTrace) {
          log(
            otpverificationScreenRoute,
            error: error,
            stackTrace: stackTrace,
          );
          ScaffoldMessenger.of(context).showSnackBar(animationsnackbar(
              "Sign In With Number",
              "An error occurred!",
              ContentType.failure));
        },
        builder: (context, controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: controller.isSendingCode
                ? Stack(children: [
                    Container(
                      color: Colors.white,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/json/lodingtrans.json',
                            height: 50),
                        const SizedBox(height: 50),
                        const Center(
                          child: Text(
                            'Sending OTP',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ])
                : Stack(children: [
                    const BackgroundImage(),
                    ListView(
                      padding: const EdgeInsets.all(20),
                      controller: scrollController,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 50),
                        Text(
                          "We've sent an SMS with a verification code to ${widget.phoneNumber}",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white70),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 50),
                        const Text(
                          'Enter OTP',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        PinInputField(
                          length: 6,
                          onFocusChange: (hasFocus) async {
                            if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                          },
                          onSubmit: (enteredOtp) async {
                            final verified =
                                await controller.verifyOtp(enteredOtp);
                            if (verified) {
                              // number verify success
                              // will call onLoginSuccess handler
                              ScaffoldMessenger.of(context).showSnackBar(
                                  animationsnackbar(
                                      "OTP Verification",
                                      "OTP verification success",
                                      ContentType.success));
                            } else {
                              // phone verification failed
                              // will call onLoginFailed or onError callbacks with the error
                              ScaffoldMessenger.of(context).showSnackBar(
                                  animationsnackbar(
                                      "OTP Verification",
                                      "OTP verification failed",
                                      ContentType.failure));
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (controller.codeSent)
                                TextButton(
                                  onPressed: controller.isOtpExpired
                                      ? () async {
                                          log(otpverificationScreenRoute,
                                              msg: 'Resend OTP');
                                          await controller.sendOTP();
                                        }
                                      : null,
                                  child: Text(
                                    controller.isOtpExpired
                                        ? 'Resend'
                                        : '${controller.otpExpirationTimeLeft.inSeconds}s',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (controller.isListeningForOtpAutoRetrieve)
                          Column(
                            children: [
                              Center(
                                  child: Lottie.asset(
                                      'assets/json/lodingtrans.json',
                                      height: 50))
                            ],
                          ),
                      ],
                    ),
                  ]),
          );
        },
      ),
    );
  }
}
