import 'package:communal_services_app/components/ComunalItem.dart';
import 'package:communal_services_app/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Платежи',
          style: GoogleFonts.playfairDisplay(
            fontSize: 28,
            color: Theme.of(context).colorScheme.inversePrimary
          )
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1, // количество столбцов
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          childAspectRatio: (1 / .4),
          children: [
            CommunalItem(name: 'Тест 123', payed: false),
            CommunalItem(name: 'Тест', payed: false),
            CommunalItem(name: 'Тест', payed: false),
            CommunalItem(name: 'Тест !!!', payed: false),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.inversePrimary,),
      ),
    );
  }
}