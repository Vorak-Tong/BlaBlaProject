import 'package:blabla/ui/screens/rides_selection/view_model/rides_selection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/ride/ride.dart';
import '../../../theme/theme.dart';
// import '../widgets/ride_preference_modal.dart';
import '../widgets/rides_selection_header.dart';
import '../widgets/rides_selection_tile.dart';

class RidesSelectionContent extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onFilterPressed;
  final Future<void> Function() onPreferencePressed;
  final ValueChanged<Ride> onRidePressed;

  const RidesSelectionContent({
    super.key,
    required this.onBackPressed,
    required this.onFilterPressed,
    required this.onPreferencePressed,
    required this.onRidePressed,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RidesSelectionViewModel>();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              left: BlaSpacings.m,
              right: BlaSpacings.m,
              top: BlaSpacings.s,
            ),
            child: Column(
              children: [
                RideSelectionHeader(
                  ridePreference: viewModel.selectedRidePreference,
                  onBackPressed: onBackPressed,
                  onFilterPressed: onFilterPressed,
                  onPreferencePressed: onPreferencePressed,
                ),
                const SizedBox(height: 100),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.matchingRides.length,
                    itemBuilder: (ctx, index) => RideSelectionTile(
                      ride: viewModel.matchingRides[index],
                      onPressed: () =>
                          onRidePressed(viewModel.matchingRides[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
