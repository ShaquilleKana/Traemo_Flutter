import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/login_screen.dart';
import 'theme/app_theme.dart';
import 'widgets/main_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  initializeDateFormatting('id_ID');
  runApp(const TraemoApp());
}

class TraemoApp extends StatefulWidget {
  const TraemoApp({super.key});

  @override
  State<TraemoApp> createState() => _TraemoAppState();
}

class _TraemoAppState extends State<TraemoApp> {
  bool _loggedIn = false;
  ThemeMode _themeMode = ThemeMode.light;
  bool _prefsLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('theme');
    if (!mounted) return;
    setState(() {
      _themeMode = saved == 'dark' ? ThemeMode.dark : ThemeMode.light;
      _prefsLoaded = true;
    });
  }

  Future<void> _persistTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', mode == ThemeMode.dark ? 'dark' : 'light');
  }

  void _toggleTheme() {
    final next = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    setState(() => _themeMode = next);
    _persistTheme(next);
  }

  @override
  Widget build(BuildContext context) {
    final light = AppTheme.light();
    final dark = AppTheme.dark();

    if (!_prefsLoaded) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light,
        darkTheme: dark,
        themeMode: ThemeMode.light,
        home: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light,
      darkTheme: dark,
      themeMode: _themeMode,
      home: _loggedIn
          ? MainShell(
              isDark: _themeMode == ThemeMode.dark,
              onToggleTheme: _toggleTheme,
              onLogout: () => setState(() => _loggedIn = false),
            )
          : LoginScreen(onLogin: () => setState(() => _loggedIn = true)),
    );
  }
}
