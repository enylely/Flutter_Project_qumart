import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:qumart/main.dart';
import 'package:qumart/viewmodels/auth_viewmodel.dart';
import 'package:qumart/viewmodels/cart_viewmodel.dart';
import 'package:qumart/viewmodels/home_viewmodel.dart';
import 'package:qumart/views/auth/login_view.dart';
import 'package:qumart/views/home/home_view.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => CartViewModel()),
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ],
        child: MaterialApp(
          title: 'Qumart',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Consumer<AuthViewModel>(
            builder: (context, authViewModel, child) {
              if (authViewModel.user != null) {
                return HomeView();
              } else {
                return LoginView();
              }
            },
          ),
        ),
      ),
    );

    // Verify that the login screen is shown initially.
    expect(find.byType(LoginView), findsOneWidget);
    expect(find.byType(HomeView), findsNothing);


    // Rebuild the widget tree.
    await tester.pump();

    // Verify that the home screen is shown after login.
    expect(find.byType(LoginView), findsNothing);
    expect(find.byType(HomeView), findsOneWidget);
  });
}
