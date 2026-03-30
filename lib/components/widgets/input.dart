import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final TextInputType keyboardType;

  const Input({
    super.key,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: ShadInput(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        placeholder: Text(placeholder),
        keyboardType: keyboardType,
      ),
    );
  }
}
