import 'package:flutter/material.dart';
import 'package:SalesMo/core/theme/color.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;
  final bool fullWidth;
  final bool outlined;
  final TextStyle? textStyle;

  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.color,
    this.fullWidth = false,
    this.outlined = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = color ?? AppColors.primary;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 48,
      child: ElevatedButton(
        onPressed: (onPressed == null || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
          disabledBackgroundColor: AppColors.disabled,
          foregroundColor: outlined ? bgColor : Colors.white,
          side: outlined ? BorderSide(color: bgColor) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                text,
                style:
                    textStyle ??
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
