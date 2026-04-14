import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/app_switch.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.onLogout,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final fg = isDark ? AppColors.darkForeground : AppColors.lightForeground;
    final muted =
        isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground;
    final card = isDark ? AppColors.darkCard : AppColors.lightCard;
    final border = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final onPrimary =
        isDark ? AppColors.darkPrimaryForeground : AppColors.lightPrimaryForeground;
    final secondary = isDark ? AppColors.darkSecondary : AppColors.lightSecondary;
    final destructive = isDark ? AppColors.darkDestructive : AppColors.lightDestructive;
    final onDestructive = isDark
        ? AppColors.darkDestructiveForeground
        : AppColors.lightDestructiveForeground;

    final menuItems = <({IconData icon, String label})>[
      (icon: Icons.settings_outlined, label: 'Settings'),
      (icon: Icons.notifications_outlined, label: 'Notifications'),
      (icon: Icons.lock_outline, label: 'Privacy & Security'),
      (icon: Icons.help_outline, label: 'Help & Support'),
    ];

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        children: [
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Manage your account',
            style: TextStyle(fontSize: 14, color: muted),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primary.withValues(alpha: 0.05),
                  primary.withValues(alpha: 0.10),
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: primary.withValues(alpha: 0.2),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(Icons.person, size: 48, color: onPrimary),
                ),
                const SizedBox(height: 16),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: fg,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail_outline, size: 16, color: muted),
                    const SizedBox(width: 8),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(fontSize: 14, color: muted),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: border),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                    size: 20,
                    color: fg,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dark Mode',
                        style: TextStyle(fontWeight: FontWeight.w500, color: fg),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isDark ? 'Enabled' : 'Disabled',
                        style: TextStyle(fontSize: 12, color: muted),
                      ),
                    ],
                  ),
                ),
                AppSwitch(
                  value: isDark,
                  onChanged: (_) => onToggleTheme(),
                  isDark: isDark,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          for (final item in menuItems)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: card,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: border),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(item.icon, size: 20, color: fg),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.label,
                            style: TextStyle(fontWeight: FontWeight.w500, color: fg),
                          ),
                        ),
                        Icon(Icons.arrow_forward, size: 20, color: muted),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 16),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onLogout,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark
                    ? destructive.withValues(alpha: 0.6)
                    : destructive,
                foregroundColor: onDestructive,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: onDestructive,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'MoneyChat v1.0.0',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: muted),
          ),
        ],
      ),
    );
  }
}
