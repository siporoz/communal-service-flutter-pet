import 'package:communal_services_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    bool switchValue = true;

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const SizedBox(height: 25),

          ListTile(
            title: Text(
              'Настройки',
              style: GoogleFonts.playfairDisplay(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          ListTile(
            leading: Text('Темная тема', style: GoogleFonts.playfairDisplay(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold
              )),
            trailing: CupertinoSwitch(
              // This bool value toggles the switch.
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
              activeColor: CupertinoColors.darkBackgroundGray,
            ),
          ),
        ]
      ),
    );
  }
}