import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final TextEditingController controller;

  const AdaptativeTextField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              placeholder: label,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              controller: controller,
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            decoration: InputDecoration(labelText: label),
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            controller: controller,
          );
  }
}
