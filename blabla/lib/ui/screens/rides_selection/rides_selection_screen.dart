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
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      final viewModel = context.read<RidesSelectionViewModel>();
      final RidePreference? newPreference = await Navigator.of(context)
          .push<RidePreference>(
            AnimationUtils.createRightToLeftRoute(
              RidePreferenceModal(
                initialPreference: viewModel.selectedRidePreference,
              ),
            ),
          );

      if (newPreference != null) {
        viewModel.selectRidePreference(newPreference);
      }
    }

    return ChangeNotifierProvider(
      create: (_) => RidesSelectionViewModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
        rideRepository: context.read<RideRepository>(),
      ),
      child: RidesSelectionContent(
        onBackPressed: onBackTap,
        onFilterPressed: onFilterPressed,
        onPreferencePressed: onPreferencePressed,
        onRidePressed: onRidePressed,
      ),
    );
  }
}
