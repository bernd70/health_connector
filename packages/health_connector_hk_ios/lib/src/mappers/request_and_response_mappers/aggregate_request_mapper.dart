import 'package:health_connector_core/health_connector_core_internal.dart'
    show
        ActivityIntensityAggregateRequest,
        AggregateRequest,
        BloodPressureAggregateRequest,
        ExerciseSessionActiveEnergyAggregateRequest,
        MeasurementUnit,
        StandardAggregateRequest;
import 'package:health_connector_hk_ios/src/mappers/aggregation_metric_mapper.dart';
import 'package:health_connector_hk_ios/src/mappers/health_data_type_mapper.dart';
import 'package:health_connector_hk_ios/src/mappers/request_and_response_mappers/exercise_session_active_energy_aggregate_request_mapper.dart';
import 'package:health_connector_hk_ios/src/pigeon/health_connector_hk_ios_api.g.dart'
    show AggregateRequestDto, StandardAggregateRequestDto;
import 'package:meta/meta.dart' show internal;

/// Converts [AggregateRequest] to [AggregateRequestDto].
@internal
extension AggregateRequestDtoMapper<U extends MeasurementUnit>
    on AggregateRequest<U> {
  AggregateRequestDto toDto() {
    switch (this) {
      case final ExerciseSessionActiveEnergyAggregateRequest request:
        return request.toDto();
      case StandardAggregateRequest():
      case BloodPressureAggregateRequest():
      case ActivityIntensityAggregateRequest():
        return StandardAggregateRequestDto(
          dataType: dataType.toDto(),
          aggregationMetric: aggregationMetric.toDto(),
          startTime: startTime.millisecondsSinceEpoch,
          endTime: endTime.millisecondsSinceEpoch,
        );
    }
  }
}
