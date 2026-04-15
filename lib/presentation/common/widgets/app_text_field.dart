import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/themes/app_spacing.dart';

/// Custom app text field widget
class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.inputFormatters,
    this.autofocus = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: maxLength != null ? null : '',
      ),
    );
  }
}
