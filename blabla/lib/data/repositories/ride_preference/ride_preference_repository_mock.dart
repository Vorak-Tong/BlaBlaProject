import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final LocationRepository locationRepository;

  late final List<Location> _locations;

  RidePreferenceRepositoryMock({
    required this.locationRepository,
  }) {
    _locations = locationRepository.getAvailableLocations();
  }

  late final List<RidePreference> _history = [
    RidePreference(
    departure: _locations[0], // London
    departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
    arrival: _locations[3], // Paris
    requestedSeats: 2,
  ),
  RidePreference(
    departure: _locations[1], // Manchester
    departureDate: DateTime.now().add(Duration(days: 7)), // Next week
    arrival: _locations[4], // Lyon
    requestedSeats: 3,
  ),
  RidePreference(
    departure: _locations[2], // Birmingham
    departureDate: DateTime.now(), // Today
    arrival: _locations[5], // Marseille
    requestedSeats: 1,
  ),
  RidePreference(
    departure: _locations[0], // London
    departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
    arrival: _locations[3], // Paris
    requestedSeats: 2,
  ),
  RidePreference(
    departure: _locations[4], // Manchester
    departureDate: DateTime.now().add(Duration(days: 7)), // Next week
    arrival: _locations[0], // Lyon
    requestedSeats: 3,
  ),
  RidePreference(
    departure: _locations[5], // Birmingham
    departureDate: DateTime.now(), // Today
    arrival: _locations[1], // Marseille
    requestedSeats: 1,
  ),
  ];

  @override
  List<RidePreference> getPreferenceHistory() {
    return List.unmodifiable(_history);
  }

  @override
  void addPreferenceToHistory(RidePreference preference) {
    _history.add(preference);
  }
}
