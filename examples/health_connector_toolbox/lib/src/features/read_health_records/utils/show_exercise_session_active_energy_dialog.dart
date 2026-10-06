import 'package:flutter/material.dart';
import 'package:health_connector/health_connector.dart';
import 'package:health_connector_toolbox/src/common/constants/app_texts.dart';

/// Shows active energy aggregation for a saved exercise session.
Future<void> showExerciseSessionActiveEnergyDialog(
  BuildContext context, {
  required ExerciseSessionRecord exerciseSession,
  required Future<Energy> Function() loadActiveEnergy,
}) {
  late final activeEnergy = Future<Energy>(loadActiveEnergy);
  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(AppTexts.workoutActiveEnergy),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<Energy>(
              future: activeEnergy,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  final error = snapshot.error;
                  return Text(
                    error is HealthConnectorException
                        ? error.message
                        : error.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  );
                }

                final energy = snapshot.requireData;
                return Column(
                  children: [
                    Text(
                      '${energy.inKilocalories.toStringAsFixed(2)} '
                      '${AppTexts.kilocalories}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    if (energy.inKilocalories == 0) ...[
                      const SizedBox(height: 8),
                      const Text(AppTexts.zeroWorkoutActiveEnergy),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(AppTexts.close),
        ),
      ],
    ),
  );
}
