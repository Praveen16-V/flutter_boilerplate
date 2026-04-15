import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_spacing.dart';

/// App loading indicator
class AppLoader extends StatelessWidget {
  final double? size;
  final Color? color;

  const AppLoader({
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 24,
      height: size ?? 24,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(
          color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

/// Full screen loader
class AppFullScreenLoader extends StatelessWidget {
  final String? message;

  const AppFullScreenLoader({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.md),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLoader(size: 40),
              if (message != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  message!,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Shimmer loading skeleton
class AppShimmerLoader extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const AppShimmerLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray200,
      highlightColor: AppColors.gray100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.sm),
        ),
      ),
    );
  }
}

/// List shimmer loader
class AppListShimmerLoader extends StatelessWidget {
  final int itemCount;
  final double itemHeight;

  const AppListShimmerLoader({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 80,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: AppShimmerLoader(
            width: double.infinity,
            height: itemHeight,
            borderRadius: BorderRadius.circular(AppSpacing.md),
          ),
        );
      },
    );
  }
}
