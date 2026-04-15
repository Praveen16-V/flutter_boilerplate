import 'package:flutter/material.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_spacing.dart';
import 'app_button.dart';

/// Custom empty state widget
class AppEmptyStateWidget extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? customIcon;
  final VoidCallback? onAction;
  final String? actionText;

  const AppEmptyStateWidget({
    super.key,
    required this.title,
    this.description,
    this.customIcon,
    this.onAction,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customIcon ??
                Icon(
                  Icons.inbox_outlined,
                  size: 64,
                  color: AppColors.gray400,
                ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (description != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
            if (onAction != null && actionText != null) ...[
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                text: actionText!,
                onPressed: onAction,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
