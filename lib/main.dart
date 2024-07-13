import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/cart_viewmodel.dart';
import 'viewmodels/home_viewmodel.dart';
import 'views/auth/login_view.dart';
import 'views/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDRT8rMKeyLDJkrRTM8uEb3pVq_rfe0gyE",
          appId: "1:484887495261:android:8eda686dd6dcbdaede43b4",
          messagingSenderId: "484887495261",
          projectId: "shrine-4b907"));
  runApp(MaterialApp(
    home: QumartApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class QumartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
    );
  }
}
