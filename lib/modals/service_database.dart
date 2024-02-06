import 'package:isar/isar.dart';
import 'package:flutter/material.dart';
import 'package:communal_services_app/modals/service.dart';
import 'package:path_provider/path_provider.dart';


class ServiceDatabase extends ChangeNotifier {
  static late Isar isar;
  // INITIAL DATABASE
  static Future<void> inititialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open([ServiceSchema], directory: dir.path);
  }

  // list of notes
  final List<Service> currentService = [];

  // Create
  Future<void> addService(String text, String image) async {
    // create new Note obj
    final newService = Service()
      ..text = text
      ..image = image
    ..date = DateTime.now();
    // save to db
    await isar.writeTxn(() => isar.services.put(newService));

    // re-read from db
    fetchServices();
  }

  // READ
  Future<void> fetchServices() async {
    List<Service> fetchedNotes = await isar.services.where().findAll();
    currentService.clear();
    currentService.addAll(fetchedNotes);
    notifyListeners();
  }

  // UPDATE
  Future<void> updateService(int id, String newText) async {
    final existingNote = await isar.services.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.services.put(existingNote));
      await fetchServices();
    }
  }

  // DELETE
  Future<void> deleteService(int id) async {
    await isar.writeTxn(() => isar.services.delete(id));
    await fetchServices();
  }
}