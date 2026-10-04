part of 'aggregate_request.dart';

/// Request to aggregate active energy burned for a saved exercise session.
///
/// {@category Core API}
@sinceV3_11_2
@internalUse
@immutable
final class ExerciseSessionActiveEnergyAggregateRequest
    extends AggregateRequest<Energy> {
  /// Creates a request for the saved exercise session identified by
  /// [exerciseSessionId] within [startTime] and [endTime].
  ///
  /// ## Throws
  ///
  /// - [ArgumentError]: If [exerciseSessionId] is [HealthRecordId.none].
  ExerciseSessionActiveEnergyAggregateRequest({
    required this.exerciseSessionId,
    required super.startTime,
    required super.endTime,
  }) : super(
         dataType: HealthDataType.activeEnergyBurned,
         aggregationMetric: AggregationMetric.sum,
       ) {
    require(
      condition: exerciseSessionId != HealthRecordId.none,
      value: exerciseSessionId,
      name: 'exerciseSessionId',
      message: 'Exercise session must have a saved record ID.',
    );
  }

  /// The platform-assigned ID of the saved exercise session.
  final HealthRecordId exerciseSessionId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ExerciseSessionActiveEnergyAggregateRequest &&
          exerciseSessionId == other.exerciseSessionId;

  @override
  int get hashCode => Object.hash(super.hashCode, exerciseSessionId);

  @override
  String toString() =>
      'ExerciseSessionActiveEnergyAggregateRequest('
      'dataType=$dataType, '
      'aggregationMetric=$aggregationMetric, '
      'spanDays=${endTime.difference(startTime).inDays}'
      ')';
}
