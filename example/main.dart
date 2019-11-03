import 'package:sunrise_sunset/sunrise_sunset.dart';

void main() async {
  try {
    final response = await SunriseSunset.getResults(
        latitude: 39.001735, longitude: -119.752744);

    if (response.success) {
      print('Sunrise: ${response.data.sunrise}');
      print('Sunset: ${response.data.sunset}');
      print('Solar Noon: ${response.data.solarNoon}');
      print('Day Length: ${response.data.dayLength}');
      print('Civil Twilight Start: ${response.data.civilTwilightBegin}');
      print('Civil Twilight End: ${response.data.civilTwilightEnd}');
      print('Nautical Twilight Start: ${response.data.nauticalTwilightBegin}');
      print('Nautical Twilight End: ${response.data.nauticalTwilightEnd}');
      print(
          'Astronomical Twilight Start: ${response.data.astronomicalTwilightBegin}');
      print(
          'Astronomical Twilight End: ${response.data.astronomicalTwilightEnd}');
    } else {
      print(response.error);
    }
  } catch (err) {
    print("Failed to get data.");
    print(err);
  }
}
