import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_5/core/theme/theme_cubit.dart';
import 'package:task_5/main.dart';

void main() {
  testWidgets('shows the authentication entry point', (tester) async {
    await tester.pumpWidget(
      BlocProvider(create: (_) => ThemeCubit(), child: const MyApp()),
    );

    expect(find.text('Login or create an account'), findsOneWidget);
    expect(find.text('Continue with email'), findsOneWidget);
  });
}
