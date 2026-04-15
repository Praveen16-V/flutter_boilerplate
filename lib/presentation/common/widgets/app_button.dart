import 'package:flutter/material.dart';
import '../../../app/themes/app_spacing.dart';

/// Custom app button widget
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isOutlined;
  final Widget? icon;
  final ButtonStyle? style;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isOutlined = false,
    this.icon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ??
        (isOutlined
            ? Theme.of(context).outlinedButtonTheme.style
            : Theme.of(context).elevatedButtonTheme.style);

    return isOutlined
        ? OutlinedButton(
            onPressed: (isLoading || isDisabled) ? null : onPressed,
            style: effectiveStyle,
            child: _buildContent(),
          )
        : ElevatedButton(
            onPressed: (isLoading || isDisabled) ? null : onPressed,
            style: effectiveStyle,
            child: _buildContent(),
          );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: AppSpacing.sm),
          Text(text),
        ],
      );
    }

    return Text(text);
  }
}
