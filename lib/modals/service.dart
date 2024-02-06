import 'package:isar/isar.dart';

// this line is need to generate file
// the run: dart run build_runner build
part 'service.g.dart';

@Collection()
class Service {
  Id id = Isar.autoIncrement;
  late String text;
  late DateTime date;
  late String image;
}