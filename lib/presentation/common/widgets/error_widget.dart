import 'package:flutter/material.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_spacing.dart';
import 'app_button.dart';

/// Custom error widget for displaying errors
class AppErrorWidget extends StatelessWidget {
  final String message;
  final String? details;
  final VoidCallback? onRetry;
  final Widget? customIcon;

  const AppErrorWidget({
    super.key,
    required this.message,
    this.details,
    this.onRetry,
    this.customIcon,
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
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.error,
                ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (details != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                details!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                text: 'Retry',
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
