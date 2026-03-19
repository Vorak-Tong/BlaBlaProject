import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier{
  final RidePreferenceRepository ridePreferenceRepository;

  RidePreference? _selectedPreference;
  List<RidePreference> _preferenceHistory = [];

  static const int maxAllowedSeats = 8;

  RidePreferenceState({
    required this.ridePreferenceRepository,
  }) {
    _preferenceHistory = List<RidePreference>.from(
      ridePreferenceRepository.getPreferenceHistory(),
    );
  }

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => _preferenceHistory;

  void selectPreference(RidePreference preference){
    if(_selectedPreference == preference) return;

    _selectedPreference = preference;
    _preferenceHistory.add(preference);
    ridePreferenceRepository.addPreferenceToHistory(preference);
    notifyListeners();
  }
}