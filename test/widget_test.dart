import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_5/core/theme/theme_cubit.dart';
import 'package:task_5/main.dart';

void main() {
  testWidgets('shows onboarding first', (tester) async {
    await tester.pumpWidget(
      BlocProvider(create: (_) => ThemeCubit(), child: const MyApp()),
    );

    expect(find.text('Everything you need'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });
}
