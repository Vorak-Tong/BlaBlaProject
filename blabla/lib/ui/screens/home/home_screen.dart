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
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onSearchRequested(RidePreference preference) async {
      await Navigator.of(context).push(
        AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()),
      );
    }

    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
        onSearchRequested: onSearchRequested,
      ),
      child: const HomeContent(),
    );
  }
}
