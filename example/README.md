
Getting the sunset and sunrise times for a parituclar lat/long is very simple.

# Get info for lat/lon "today"

```dart
main() async {
  var response = await SunriseSunset.getResults(
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

# Get info for lat/lon for a historical date

```dart
main() async {
  var response = await SunriseSunset.getResults(date: new DateTime.utc(1989, 11, 9);.
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
