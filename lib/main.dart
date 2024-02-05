import 'package:communal_services_app/pages/ServicesPage.dart';
import 'package:communal_services_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // initilize note isar db
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
    providers: [
      // Theme Provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ServicesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData
    );
  }
}