import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  final RidePreferenceState ridePreferenceState;
  final Future<void> Function(RidePreference preference) onSearchRequested;

  HomeViewModel({
    required this.ridePreferenceState,
    required this.onSearchRequested,
  }) {
    ridePreferenceState.addListener(_onRidePreferenceStateChanged);
  }

  RidePreference? get selectedPreference => ridePreferenceState.selectedPreference;
  List<RidePreference> get history => ridePreferenceState.preferenceHistory;

  void _onRidePreferenceStateChanged(){
    notifyListeners();
  }

  Future<void> onRidePrefSelected(RidePreference preference) async {
    ridePreferenceState.selectPreference(preference);
    await onSearchRequested(preference);
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(_onRidePreferenceStateChanged);
    super.dispose();
  }
}