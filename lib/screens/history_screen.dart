import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/formatters.dart';

class HistoryTransaction {
  const HistoryTransaction({
    required this.id,
    required this.category,
    required this.amount,
    required this.type,
    required this.date,
    required this.icon,
  });

  final String id;
  final String category;
  final int amount;
  final String type;
  final DateTime date;
  final String icon;
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.isDark});

  final bool isDark;

  static final DateTime _anchor = DateTime(2026, 4, 12);

  static final List<HistoryTransaction> _transactions = [
    HistoryTransaction(
      id: '1',
      category: 'Gaji',
      amount: 5000000,
      type: 'income',
      date: DateTime(2026, 4, 10),
      icon: 'wallet',
    ),
    HistoryTransaction(
      id: '2',
      category: 'Makan',
      amount: 45000,
      type: 'expense',
      date: DateTime(2026, 4, 11),
      icon: 'food',
    ),
    HistoryTransaction(
      id: '3',
      category: 'Bensin',
      amount: 50000,
      type: 'expense',
      date: DateTime(2026, 4, 11),
      icon: 'car',
    ),
    HistoryTransaction(
      id: '4',
      category: 'Coffee',
      amount: 25000,
      type: 'expense',
      date: DateTime(2026, 4, 11),
      icon: 'coffee',
    ),
    HistoryTransaction(
      id: '5',
      category: 'Belanja',
      amount: 150000,
      type: 'expense',
      date: DateTime(2026, 4, 12),
      icon: 'shopping',
    ),
    HistoryTransaction(
      id: '6',
      category: 'Makan',
      amount: 38000,
      type: 'expense',
      date: DateTime(2026, 4, 12),
      icon: 'food',
    ),
  ];

  Map<String, List<HistoryTransaction>> _grouped() {
    final map = <String, List<HistoryTransaction>>{};
    for (final t in _transactions) {
      final key = formatHistoryDate(t.date, todayAnchor: _anchor);
      map.putIfAbsent(key, () => []).add(t);
    }
    return map;
  }

  IconData _iconFor(String icon) {
    switch (icon) {
      case 'coffee':
        return Icons.local_cafe_outlined;
      case 'car':
        return Icons.directions_car_outlined;
      case 'food':
        return Icons.restaurant_outlined;
      case 'shopping':
        return Icons.shopping_bag_outlined;
      case 'wallet':
        return Icons.account_balance_wallet_outlined;
      default:
        return Icons.account_balance_wallet_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fg = isDark ? AppColors.darkForeground : AppColors.lightForeground;
    final muted =
        isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground;
    final card = isDark ? AppColors.darkCard : AppColors.lightCard;
    final border = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final income = isDark ? AppColors.darkIncome : AppColors.lightIncome;
    final expense = isDark ? AppColors.darkExpense : AppColors.lightExpense;

    final groups = _grouped();
    final keys = groups.keys.toList();

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        children: [
          Text(
            'History',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'All your transactions',
            style: TextStyle(fontSize: 14, color: muted),
          ),
          const SizedBox(height: 24),
          for (final dateKey in keys) ...[
            Text(
              dateKey,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: muted,
              ),
            ),
            const SizedBox(height: 12),
            for (final t in groups[dateKey]!)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: border),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: t.type == 'income'
                                    ? income.withValues(alpha: 0.1)
                                    : expense.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                _iconFor(t.icon),
                                size: 20,
                                color: t.type == 'income' ? income : expense,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.category,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: fg,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    formatTimeId(t.date),
                                    style: TextStyle(fontSize: 12, color: muted),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${t.type == 'income' ? '+' : '-'} ${formatCurrencyIdr(t.amount)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: t.type == 'income' ? income : expense,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            t.type == 'income'
                                ? Icons.north_east
                                : Icons.south_east,
                            size: 16,
                            color: t.type == 'income' ? income : expense,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
