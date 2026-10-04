import 'package:health_connector_core/health_connector_core_internal.dart'
    show ExerciseSessionActiveEnergyAggregateRequest, sinceV3_11_2;
import 'package:health_connector_hk_ios/src/pigeon/health_connector_hk_ios_api.g.dart'
    show ExerciseSessionActiveEnergyAggregateRequestDto;
import 'package:meta/meta.dart' show internal;

/// Converts [ExerciseSessionActiveEnergyAggregateRequest] to its HealthKit DTO.
///
/// HealthKit reads the saved workout by ID, so the request's time range is
/// omitted from the DTO.
@sinceV3_11_2
@internal
extension ExerciseSessionActiveEnergyAggregateRequestDtoMapper
    on ExerciseSessionActiveEnergyAggregateRequest {
  ExerciseSessionActiveEnergyAggregateRequestDto toDto() {
    return ExerciseSessionActiveEnergyAggregateRequestDto(
      exerciseSessionId: exerciseSessionId.value,
    );
  }
}
