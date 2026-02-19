import 'dart:async';

import 'package:SalesMo/core/theme/color.dart';
import 'package:SalesMo/features/auth/components/otp_field.dart';
import 'package:SalesMo/features/auth/reset_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SalesMo/components/widgets/button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int currentStep = 30;
  Timer? timer;
  bool isCounting = false;

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    setState(() {
      currentStep = 30;
      isCounting = true;
    });

    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentStep == 0) {
        timer.cancel();

        setState(() {
          isCounting = false;
        });
      } else {
        setState(() {
          currentStep--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 42,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Enter the OTP code we just sent you on your email',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),

              const SizedBox(height: 30),

              const OtpTextField(),

              const SizedBox(height: 24),

              RichText(
                text: TextSpan(
                  text: "Didn't receive the OTP? ",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  children: [
                    !isCounting
                        ? TextSpan(
                            text: "Resend OTP",
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _startTimer();
                              },
                          )
                        : TextSpan(
                            text: "$currentStep seconds",
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryDark,
                            ),
                          ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Button(
                  text: 'Reset Password',
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResetPasswordPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
