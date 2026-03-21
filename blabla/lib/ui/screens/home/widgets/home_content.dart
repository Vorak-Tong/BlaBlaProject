import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widgets/pickers/bla_ride_preference_picker.dart';
import '../widgets/home_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Stack(
          children: [
            _buildBackground(),
            _buildForeground(viewModel),
          ],
        );
      },
    );
  }

  Widget _buildForeground(HomeViewModel viewModel) {
    return Column(
      children: [
        // 1 - THE HEADER
        SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),

        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2 - THE FORM
              BlaRidePreferencePicker(
                initRidePreference: viewModel.selectedPreference,
                onRidePreferenceSelected: viewModel.onRidePrefSelected,
              ),
              SizedBox(height: BlaSpacings.m),

              // 3 - THE HISTORY
              _buildHistory(viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(HomeViewModel viewModel) {
    // Reverse the history of preferences
    final history = viewModel.history.reversed.toList();
    return SizedBox(
      height: 200, // Set a fixed height
      child: ListView.builder(
        shrinkWrap: true, // Fix ListView height issue
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () => viewModel.onRidePrefSelected(history[index]),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}
