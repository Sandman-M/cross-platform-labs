import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Імпортуйте main.dart. Переконайтеся, що назва пакету відповідає вашому проекту.
// Зазвичай це виглядає так (замініть 'lab6' на назву вашої папки проекту):
import 'package:lab6/main.dart'; 

void main() {
  testWidgets('Lab 6 UI smoke test', (WidgetTester tester) async {
    // 1. Запускаємо наш додаток
    await tester.pumpWidget(MyApp());

    // 2. Перевіряємо, чи є на екрані заголовок з AppBar
    expect(find.text('Лабораторна робота №6 - Варіант 1'), findsOneWidget);

    // 3. Перевіряємо, чи є на екрані один із блоків, наприклад "b (250)"
    expect(find.text('b (250)'), findsOneWidget);

    // 4. Перевіряємо, що тексту "0" (від старого лічильника) немає
    expect(find.text('0'), findsNothing);
  });
}