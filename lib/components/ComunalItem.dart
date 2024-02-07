import 'package:communal_services_app/modals/service_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunalItem extends StatelessWidget {
  final String name;
  final bool payed;
  final int id;

  const CommunalItem({
    super.key,
    required this.name,
    required this.payed,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {

    // Delete item
    void deleteService() {
      context.read<ServiceDatabase>().deleteService(id);
    }

    return Card(
      elevation: 0.15,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: GoogleFonts.playfairDisplay(
                fontSize: 22  ,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary
              )
            ),
            payed ?
              Text('Оплачено')
              : Text('Не оплачено')
            ,
            Positioned(
              top: 8.0,
              right: 8.0,
              child: IconButton(
                icon: Icon(Icons.delete),
                iconSize: 18,
                color: Colors.grey.shade600,
                onPressed: deleteService,
              ),
            ),
          ],
        ),
      )
    );
  }
}