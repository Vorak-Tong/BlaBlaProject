import '../../../model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  List<RidePreference> getPreferenceHistory();

  void addPreferenceToHistory(RidePreference preference);
}