import 'dart:math';

class CalculatorEngine {
  static String calculate(String expression) {
    try {
      expression = expression.replaceAll('x', '*');

      expression = _processPercentages(expression);

      List<String> tokens = _tokenize(expression);

      double result = _evaluate(tokens);

      return _formatResult(result);
    } catch (e) {
      return 'Error';
    }
  }

  static String _processPercentages(String expression) {
    // Обрабатываем проценты в выражении
    // Например: 3 * 10% -> 3 * 0.1
    RegExp percentagePattern = RegExp(r'(\d+(\.\d+)?)%');
    while (percentagePattern.hasMatch(expression)) {
      expression = expression.replaceAllMapped(percentagePattern, (match) {
        double value = double.parse(match.group(1)!) / 100;
        return value.toString();
      });
    }
    return expression;
  }

  static List<String> _tokenize(String expression) {
    List<String> tokens = [];
    String currentNumber = '';
    bool isNegative = false;
    
    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];
      
      if (char == '+' || char == '-' || char == '*' || char == '/' || char == '%') {
        // Проверяем, является ли минус знаком отрицательного числа
        if (char == '-' && (i == 0 || expression[i-1] == '+' || expression[i-1] == '-' || 
            expression[i-1] == '*' || expression[i-1] == '/' || expression[i-1] == '%')) {
          isNegative = true;
          continue;
        }
        
        if (currentNumber.isNotEmpty) {
          tokens.add(isNegative ? '-$currentNumber' : currentNumber);
          currentNumber = '';
          isNegative = false;
        }
        tokens.add(char);
      } else {
        currentNumber += char;
      }
    }
    
    if (currentNumber.isNotEmpty) {
      tokens.add(isNegative ? '-$currentNumber' : currentNumber);
    }
    
    return tokens;
  }

  static double _evaluate(List<String> tokens) {
    // Сначала выполняем умножение и деление
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == '*' || tokens[i] == '/') {
        double left = double.parse(tokens[i - 1]);
        double right = double.parse(tokens[i + 1]);
        double result = 0;
        
        switch (tokens[i]) {
          case '*':
            result = left * right;
            break;
          case '/':
            if (right == 0) throw Exception('Division by zero');
            result = left / right;
            break;
        }
        
        tokens.removeRange(i - 1, i + 2);
        tokens.insert(i - 1, result.toString());
        i -= 2;
      }
    }
    
    // Затем выполняем сложение и вычитание
    double result = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      double right = double.parse(tokens[i + 1]);
      switch (tokens[i]) {
        case '+':
          result += right;
          break;
        case '-':
          result -= right;
          break;
      }
    }
    
    return result;
  }

  static String _formatResult(double result) {
    // Если число целое, возвращаем без десятичной части
    if (result == result.roundToDouble()) {
      return result.round().toString();
    }
    
    // Ограничиваем количество знаков после запятой
    String formatted = result.toStringAsFixed(8);
    
    // Удаляем лишние нули в конце
    while (formatted.contains('.') && formatted.endsWith('0')) {
      formatted = formatted.substring(0, formatted.length - 1);
    }
    
    // Удаляем точку, если она последняя
    if (formatted.endsWith('.')) {
      formatted = formatted.substring(0, formatted.length - 1);
    }
    
    return formatted;
  }
} 