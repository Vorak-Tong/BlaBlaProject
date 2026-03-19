import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/animations_util.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void onRidePrefSelected(RidePreference selectedPreference) async {
  //   // 1- Ask the service to update the current preference
  //   final ridePreferenceState = context.read<RidePreferenceState>();

  //   ridePreferenceState.selectPreference(selectedPreference);

  //   // 2 - Navigate to the rides screen
  //   await Navigator.of(
  //     context,
  //   ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));

  //   // 3 - After wait  - Update the state   - TODO Improve this with proper state managagement
  //   setState(() {});
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();

    final ridePreferenceState = context.read<RidePreferenceState>();

    viewModel = HomeViewModel(
      ridePreferenceState: ridePreferenceState,
      onSearchRequested: onSearchRequested,
    );
  }

  Future<void> onSearchRequested(RidePreference preference) async {
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()));
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return HomeContent(viewModel: viewModel);
  }
}
