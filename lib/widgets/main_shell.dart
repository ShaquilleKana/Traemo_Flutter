import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/history_screen.dart';
import '../screens/profile_screen.dart';
import '../theme/app_colors.dart';

class MainShell extends StatefulWidget {
  const MainShell({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.onLogout,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onLogout;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final card = widget.isDark ? AppColors.darkCard : AppColors.lightCard;
    final border = widget.isDark ? AppColors.darkBorder : AppColors.lightBorder;

    final pages = <Widget>[
      const ChatScreen(),
      DashboardScreen(isDark: widget.isDark),
      HistoryScreen(isDark: widget.isDark),
      ProfileScreen(
        isDark: widget.isDark,
        onToggleTheme: widget.onToggleTheme,
        onLogout: widget.onLogout,
      ),
    ];

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: IndexedStack(
              index: _index,
              children: pages,
            ),
            bottomNavigationBar: DecoratedBox(
              decoration: BoxDecoration(
                color: card,
                border: Border(top: BorderSide(color: border)),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: BottomNavigationBar(
                    currentIndex: _index,
                    onTap: (i) => setState(() => _index = i),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.chat_bubble_outline, size: 24),
                        activeIcon: Icon(Icons.chat_bubble, size: 24),
                        label: 'Chat',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard_outlined, size: 24),
                        activeIcon: Icon(Icons.dashboard, size: 24),
                        label: 'Dashboard',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.history, size: 24),
                        label: 'History',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline, size: 24),
                        activeIcon: Icon(Icons.person, size: 24),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
