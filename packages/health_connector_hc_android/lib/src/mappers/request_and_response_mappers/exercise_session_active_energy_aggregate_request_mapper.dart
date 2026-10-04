import 'package:health_connector_core/health_connector_core_internal.dart'
    show
        ExerciseSessionActiveEnergyAggregateRequest,
        HealthRecordId,
        sinceV3_12_0;
import 'package:health_connector_hc_android/src/pigeon/health_connector_hc_android_api.g.dart'
    show ExerciseSessionActiveEnergyAggregateRequestDto;
import 'package:meta/meta.dart' show internal;

/// Converts [ExerciseSessionActiveEnergyAggregateRequest] to its platform DTO.
@sinceV3_12_0
@internal
extension ExerciseSessionActiveEnergyAggregateRequestDtoMapper
    on ExerciseSessionActiveEnergyAggregateRequest {
  ExerciseSessionActiveEnergyAggregateRequestDto toDto() {
    return ExerciseSessionActiveEnergyAggregateRequestDto(
      exerciseSessionId: exerciseSessionId.value,
      startTime: startTime.millisecondsSinceEpoch,
      endTime: endTime.millisecondsSinceEpoch,
    );
  }
}

/// Converts [ExerciseSessionActiveEnergyAggregateRequestDto] to its
/// domain model.
@sinceV3_12_0
@internal
extension ExerciseSessionActiveEnergyAggregateRequestDomainMapper
    on ExerciseSessionActiveEnergyAggregateRequestDto {
  ExerciseSessionActiveEnergyAggregateRequest toDomain() {
    return ExerciseSessionActiveEnergyAggregateRequest(
      exerciseSessionId: HealthRecordId(exerciseSessionId),
      startTime: DateTime.fromMillisecondsSinceEpoch(startTime, isUtc: true),
      endTime: DateTime.fromMillisecondsSinceEpoch(endTime, isUtc: true),
    );
  }
}
