import 'package:communal_services_app/modals/month_payed_service_database.dart';
import 'package:communal_services_app/modals/service_database.dart';
import 'package:communal_services_app/pages/ServicesPage.dart';
import 'package:communal_services_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceDatabase.inititialize();

  runApp(
    MultiProvider(
    providers: [
      // Note Provider
      ChangeNotifierProvider(create: (context) => ServiceDatabase()),

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