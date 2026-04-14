class ParsedTransaction {
  const ParsedTransaction({
    required this.category,
    required this.amount,
    required this.type,
  });

  final String category;
  final int amount;
  final String type; // 'income' | 'expense'
}

ParsedTransaction? parseTransaction(String text) {
  const incomeKeywords = ['gaji', 'salary', 'bonus', 'income'];
  const expenseKeywords = [
    'makan',
    'food',
    'bensin',
    'fuel',
    'belanja',
    'shopping',
    'transport',
    'coffee',
  ];

  final lowerText = text.toLowerCase();
  final amountMatch = RegExp(r'(\d+)k?', caseSensitive: false).firstMatch(text);
  if (amountMatch == null) return null;

  var amount = int.tryParse(amountMatch.group(1) ?? '') ?? 0;
  if (text.toLowerCase().contains('k') && amount < 1000) {
    amount *= 1000;
  }

  final isIncome = incomeKeywords.any(lowerText.contains);
  final isExpense = expenseKeywords.any(lowerText.contains);
  if (!isIncome && !isExpense) return null;

  final rawCategory = lowerText.split(' ').first;
  final category =
      rawCategory.isEmpty ? '' : '${rawCategory[0].toUpperCase()}${rawCategory.substring(1)}';

  return ParsedTransaction(
    category: category,
    amount: amount,
    type: isIncome ? 'income' : 'expense',
  );
}
