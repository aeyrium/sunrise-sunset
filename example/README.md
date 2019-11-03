
```dart
main() async {
  var response = await SunriseSunset().getFormattedResults(
        latitude: 39.001735, longitude: -119.752744);

  if (response.success) {
    print('Sunrise: ${response.data.sunrise}');
    print('Sunset: ${response.data.sunset}');
    print('Solar Noon: ${response.data.solar_noon}');
    print('Day Length: ${response.data.day_length}');
    print('Civil Twilight Start: ${response.data.sunset}');
    print('Civil Twilight End: ${response.data.sunset}');
    print('Nautical Twilight Start: ${response.data.sunset}');
    print('Nautical Twilight End: ${response.data.sunset}');
    print('Astronomical Twilight Start: ${response.data.sunset}');
    print('Astronomical Twilight End: ${response.data.sunset}');
  } else {
    print(response.error);
  }
}
```

```json
{
  "results": {
    "sunrise": "2019-11-03T14:29:10+00:00",
    "sunset": "2019-11-04T00:55:58+00:00",
    "solar_noon": "2019-11-03T19:42:34+00:00",
    "day_length": 37608,
    "civil_twilight_begin": "2019-11-03T14:01:27+00:00",
    "civil_twilight_end": "2019-11-04T01:23:41+00:00",
    "nautical_twilight_begin": "2019-11-03T13:29:49+00:00",
    "nautical_twilight_end": "2019-11-04T01:55:19+00:00",
    "astronomical_twilight_begin": "2019-11-03T12:58:38+00:00",
    "astronomical_twilight_end": "2019-11-04T02:26:30+00:00"
  },
  "status": "OK"
}
```