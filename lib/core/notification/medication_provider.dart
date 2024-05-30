import 'package:flutter/material.dart';
import '../../features/model/medication.dart';


class MedicationProvider with ChangeNotifier {
  final List<Medication> _medications = [];

  List<Medication> get medications => _medications;

  void addMedication(Medication medication) {
    _medications.add(medication);
    notifyListeners();
  }
}
