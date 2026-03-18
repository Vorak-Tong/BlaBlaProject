import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/data/repositories/user/user_repository.dart';
import 'package:blabla/data/repositories/user/user_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void mainDev() {
  runApp(
    MultiProvider(
      providers: [
        Provider<LocationRepository>(
          create: (_) => LocationRepositoryMock(),
        ),
        Provider<UserRepository>(
          create: (_) => UserRepositoryMock(),
        ),
        Provider<RideRepository>(
          create: (context) => RideRepositoryMock(
            locationRepository: context.read<LocationRepository>(),
            userRepository: context.read<UserRepository>(),
          ),
        ),
        Provider<RidePreferenceRepository>(
          create: (context) => RidePreferenceRepositoryMock(
            locationRepository: context.read<LocationRepository>(),
          ),
        ),
      ],
      child: const BlaBlaApp(),
    ),
  );
}
