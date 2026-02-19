import 'package:SalesMo/features/auth/components/PasswordField.dart';
import 'package:flutter/material.dart';
import 'package:SalesMo/components/widgets/button.dart';
import 'package:SalesMo/core/theme/color.dart';
import 'package:SalesMo/features/auth/otp.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
                'Reset Password',
                style: TextStyle(
                  fontSize: 42,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit auctor dui, sed efficitur.',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),

              const SizedBox(height: 30),

              SizedBox(width: double.infinity, child: PasswordField(label: "New Password")),
              const SizedBox(height: 16),
              SizedBox(width: double.infinity, child: PasswordField(label: "Confirm Password")),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: Button(
                  text: "Send Reset Link",
                  textStyle: const TextStyle(fontSize: 18),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OtpPage()),
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
