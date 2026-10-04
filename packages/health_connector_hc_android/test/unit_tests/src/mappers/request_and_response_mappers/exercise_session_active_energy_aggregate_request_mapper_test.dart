import 'package:flutter_test/flutter_test.dart';
import 'package:health_connector_core/health_connector_core_internal.dart';
import 'package:health_connector_hc_android/src/mappers/request_and_response_mappers/exercise_session_active_energy_aggregate_request_mapper.dart';
import 'package:health_connector_hc_android/src/pigeon/health_connector_hc_android_api.g.dart';

import '../../../utils/fake_data.dart';

void main() {
  group('ExerciseSessionActiveEnergyAggregateRequestMapper', () {
    test('maps the exercise session ID and time range to a DTO', () {
      // Given
      final request = ExerciseSessionActiveEnergyAggregateRequest(
        exerciseSessionId: HealthRecordId(FakeData.fakeId),
        startTime: FakeData.fakeStartTime,
        endTime: FakeData.fakeEndTime,
      );

      // When
      final dto = request.toDto();

      // Then
      expect(
        dto,
        ExerciseSessionActiveEnergyAggregateRequestDto(
          exerciseSessionId: FakeData.fakeId,
          startTime: FakeData.fakeStartTime.millisecondsSinceEpoch,
          endTime: FakeData.fakeEndTime.millisecondsSinceEpoch,
        ),
      );
    });

    test('maps a DTO to an active energy sum request with UTC times', () {
      // Given
      final dto = ExerciseSessionActiveEnergyAggregateRequestDto(
        exerciseSessionId: FakeData.fakeId,
        startTime: FakeData.fakeStartTime.millisecondsSinceEpoch,
        endTime: FakeData.fakeEndTime.millisecondsSinceEpoch,
      );

      // When
      final request = dto.toDomain();

      // Then
      expect(request.exerciseSessionId, HealthRecordId(FakeData.fakeId));
      expect(request.startTime, FakeData.fakeStartTime.toUtc());
      expect(request.endTime, FakeData.fakeEndTime.toUtc());
      expect(request.startTime.isUtc, isTrue);
      expect(request.endTime.isUtc, isTrue);
      expect(request.dataType, HealthDataType.activeEnergyBurned);
      expect(request.aggregationMetric, AggregationMetric.sum);
      expect(request.toDto(), dto);
    });

    test('rejects a DTO with an unsaved exercise session ID', () {
      // Given
      final dto = ExerciseSessionActiveEnergyAggregateRequestDto(
        exerciseSessionId: HealthRecordId.none.value,
        startTime: FakeData.fakeStartTime.millisecondsSinceEpoch,
        endTime: FakeData.fakeEndTime.millisecondsSinceEpoch,
      );

      // When / Then
      expect(dto.toDomain, throwsArgumentError);
    });
  });
}
