import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  final RideRepository rideRepository;

  RidesSelectionViewModel({
    required this.ridePreferenceState,
    required this.rideRepository,
  }) {
    ridePreferenceState.addListener(_onRidePreferenceStateChanged);
  }

  RidePreference get selectedRidePreference =>
      ridePreferenceState.selectedPreference!;

  List<Ride> get matchingRides =>
      rideRepository.getRidesFor(selectedRidePreference);

  void selectRidePreference(RidePreference preference) {
    ridePreferenceState.selectPreference(preference);
  }

  void _onRidePreferenceStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(_onRidePreferenceStateChanged);
    super.dispose();
  }
}
