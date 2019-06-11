import 'package:sunrise_sunset/src/service/options.dart';
import 'package:test/test.dart';

import 'package:sunrise_sunset/sunrise_sunset.dart';

import 'mock/mock_data_service.dart';

void main() {
  final MockDataService mock = MockDataService();

  test(
    'Test query params',
    () {
      final latitude = 145.0;
      final longitude = 166.0;
      final date = DateTime(2020, 06, 06);
      final stringDate = "${date.year}-${date.month}-${date.day}";
      final options =
          Options(date: date, latitude: latitude, longitude: longitude);
      Map<String, dynamic> query = options.toQueryParams();
      expect(query["date"], stringDate);
      expect(query["lat"], latitude);
      expect(query["lon"], longitude);
      expect(query["formatted"], '0');
    },
  );

  test(
    'Test OK response formatted',
    () async {
      final sunriseSunset = SunriseSunset(dataService: mock);
      final response = await sunriseSunset.getFormattedResults(
          latitude: 150, longitude: 150);
      expect(response.success, true);
      expect(response.error, isEmpty);
      expect(response.data, isNotNull);
      expect(response.data.dayLength, "9:38:53");
      expect(response.data.astronomicalTwilightEnd, "6:38:43 PM");
    },
  );

  test(
    'Test OK response without format',
    () async {
      mock.data = mock1;
      final sunriseSunset = SunriseSunset(dataService: mock);
      final response =
          await sunriseSunset.getResults(latitude: 150, longitude: 150);
      expect(response.success, true);
      expect(response.error, isEmpty);
      expect(response.data, isNotNull);
      expect(response.data.dayLength, 51444);
      expect(response.data.astronomicalTwilightEnd,
          DateTime.parse("2015-05-21T21:07:45+00:00"));
    },
  );

  test(
    'Test INVALID_REQUEST',
    () async {
      mock.data = mock2;
      final sunriseSunset = SunriseSunset(dataService: mock);
      final response =
          await sunriseSunset.getResults(latitude: 150, longitude: 150);
      expect(response.success, false);
      expect(response.error, isNotEmpty);
      expect(response.data, isNull);
      expect(response.error.contains("lat"), true);
    },
  );

  test(
    'Test INVALID_DATE',
    () async {
      mock.data = mock3;
      final sunriseSunset = SunriseSunset(dataService: mock);
      final response =
          await sunriseSunset.getResults(latitude: 150, longitude: 150);
      expect(response.success, false);
      expect(response.error, isNotEmpty);
      expect(response.data, isNull);
      expect(response.error.contains("date"), true);
    },
  );

  test(
    'Test UNKNOWN_ERROR',
    () async {
      mock.data = mock4;
      final sunriseSunset = SunriseSunset(dataService: mock);
      final response =
          await sunriseSunset.getResults(latitude: 150, longitude: 150);
      expect(response.success, false);
      expect(response.error, isNotEmpty);
      expect(response.data, isNull);
      expect(response.error.contains("server error"), true);
    },
  );
}
