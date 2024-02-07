import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectMonth extends StatefulWidget {
  const SelectMonth({super.key});

  @override
  State<SelectMonth> createState() => _SelectMonthState();
}

class _SelectMonthState extends State<SelectMonth> {

  int _selectedFruit = 0;

  @override
  void initState() {
    super.initState();
     DateTime now = DateTime.now();
    _selectedFruit = now.month - 1;
  }

  final List<String> _fruitNames = <String>[
    "Январь",
    "Февраль",
    "Март",
    "Апрель",
    "Май",
    "Июнь",
    "Июль",
    "Август",
    "Сентябрь",
    "Октябрь",
    "Ноябрь",
    "Декабрь"
  ];

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 320,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            border: null,
            middle: Column(
              children: [
                Text(
                  'Выберете месяц',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            automaticallyImplyLeading: false,
            automaticallyImplyMiddle: false,
          ),
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 32,
            scrollController: FixedExtentScrollController(
              initialItem: _selectedFruit,
            ),
            onSelectedItemChanged: (int selectedItem) {
              setState(() {
                _selectedFruit = selectedItem;
              });
            },
            children:
                List<Widget>.generate(_fruitNames.length, (int index) {
                return Center(child:
                  Text(
                    _fruitNames[index],
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22  ,
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                )
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: _showDialog,
        child: Text(
          _fruitNames[_selectedFruit],
          style: GoogleFonts.playfairDisplay(
            fontSize: 15,
            color: Theme.of(context).colorScheme.inversePrimary,
            decoration: TextDecoration.underline
          )
        ),
      ),
    );
  }
}