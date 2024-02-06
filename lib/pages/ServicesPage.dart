import 'package:communal_services_app/components/ComunalItem.dart';
import 'package:communal_services_app/components/drawer.dart';
import 'package:communal_services_app/modals/service.dart';
import 'package:communal_services_app/modals/service_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {

  @override
  void initState() {
    super.initState();

    // On app start, fetch existing notes
    readServices();
  }

  final textController = TextEditingController();

  // read services
  void readServices() {
    context.read<ServiceDatabase>().fetchServices();
  }

  // Add new service
  void addServiceModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Новый платеж',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              child: Column(children: [
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Название платежа',
                  ),
                )
              ])
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                context.read<ServiceDatabase>().addService(textController.text, textController.text);
                textController.clear();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: const Text('Добавить'),
            ),
          ],
        ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    // note database
    final serviceDatabase = context.watch<ServiceDatabase>();

    // current services
    List<Service> currentServices = serviceDatabase.currentNotes;

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
            for (var item in currentServices)
              CommunalItem(name: item.text, payed: false)
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addServiceModal,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.inversePrimary,),
      ),
    );
  }
}