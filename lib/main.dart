import 'package:provider/provider.dart';
import 'state_provider.dart';
import 'myApp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
