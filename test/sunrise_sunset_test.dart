import 'package:test/test.dart';

import 'package:sunrise_sunset/sunrise_sunset.dart';

void main() {
  test(
    'Test OK response without format',
    () async {
      final response = await SunriseSunset.getResults(
          latitude: 39.001735, longitude: -119.752744);
      expect(response.success, true);
      expect(response.error, isEmpty);
      expect(response.data, isNotNull);
      expect(response.data.dayLength, 47525);
      expect(response.data.astronomicalTwilightEnd,
          DateTime.parse("2020-04-14T04:10:06+00:00"));
    },
  );

  test(
    'Test INVALID_REQUEST',
    () async {
      final response = await SunriseSunset.getResults(longitude: 150);
      expect(response.success, false);
      expect(response.error, isNotEmpty);
      expect(response.data, isNull);
      expect(response.error.contains("lat"), true);
    },
  );

  test('Test all values', () async {
    var response = await SunriseSunset.getResults(
        date: DateTime.now().toLocal(),
        latitude: 39.001735,
        longitude: -119.752744);
    print(response);
  });
}
