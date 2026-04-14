import 'package:intl/intl.dart';

String formatCurrencyIdr(num amount) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  ).format(amount);
}

String formatHistoryDate(DateTime date, {required DateTime todayAnchor}) {
  final today = DateTime(todayAnchor.year, todayAnchor.month, todayAnchor.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final d = DateTime(date.year, date.month, date.day);
  if (d == today) return 'Today';
  if (d == yesterday) return 'Yesterday';
  return DateFormat('d MMM', 'id_ID').format(date);
}

String formatTimeId(DateTime date) {
  return DateFormat.Hm('id_ID').format(date);
}
