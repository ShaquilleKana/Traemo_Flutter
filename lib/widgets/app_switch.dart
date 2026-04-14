import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Matches shadcn `Switch`: track uses primary when on, switch-background when off;
/// thumb uses card / primary-foreground styling.
class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.isDark = false,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final trackOff =
        isDark ? AppColors.darkSwitchBackground : AppColors.lightSwitchBackground;
    final trackOn = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final thumbOn =
        isDark ? AppColors.darkPrimaryForeground : AppColors.lightPrimaryForeground;
    final thumbOff = isDark ? AppColors.darkForeground : AppColors.lightCard;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 32,
        height: 18,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: value ? trackOn : trackOff,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.transparent),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: value ? thumbOn : thumbOff,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
