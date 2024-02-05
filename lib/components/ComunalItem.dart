import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunalItem extends StatelessWidget {
  final String name;
  final bool payed;

  const CommunalItem({
    super.key,
    required this.name,
    required this.payed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.15,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          name,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary
          )
        ),
      )
    );
  }
}