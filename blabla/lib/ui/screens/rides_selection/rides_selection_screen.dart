import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/rides_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_selection_content.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart' show AnimationUtils;

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///

class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late RidesSelectionViewModel viewModel;

  @override
  void initState() {
    super.initState();

    final ridePreferenceState = context.read<RidePreferenceState>();
    final rideRepository = context.read<RideRepository>();

    viewModel = RidesSelectionViewModel(
      ridePreferenceState: ridePreferenceState,
      rideRepository: rideRepository,
    );
  }

  void onBackTap() {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRidePressed(Ride ride) {
    // TODO
  }

  Future<void> onPreferencePressed() async {
    // 1 - Navigate to the rides preference picker
    final RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(
              initialPreference: viewModel.selectedRidePreference,
            ),
          ),
        );

    if (newPreference != null) {
      // 2 - Ask the service to update the current preference
      viewModel.selectRidePreference(newPreference);
    }
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RidesSelectionContent(
      viewModel: viewModel,
      onBackPressed: onBackTap,
      onFilterPressed: onFilterPressed,
      onPreferencePressed: onPreferencePressed,
      onRidePressed: onRidePressed,
    );
  }
}
