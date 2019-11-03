library sunrise_sunset;

export 'src/sunrise_sunset_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'src/sunrise_sunset_response.dart';

class SunriseSunset {
  /// Get results from the Sunrise Sunset API ,
  /// Time values in response will be expressed following ISO 8601 and day_length will be expressed in seconds
  static Future<SunriseSunsetResponse> getResults({
    DateTime date,
    double latitude,
    double longitude,
  }) async {
    try {
      Uri uri = Uri(
        scheme: 'https',
        host: 'api.sunrise-sunset.org',
        path: '/json',
        queryParameters: {
          'date': 'today',
          'lat': latitude.toString(),
          'lng': longitude.toString(),
          'formatted': '0'
        },
      );
      print('Calling ${uri.toString()}');

      http.Response response;
      try {
        response = await http.get(uri);
      } on Exception catch (e) {
        print('Network Error: $e');
        throw e;
      }

      final jsonResponse = json.decode(response.body);
      return SunriseSunsetResponse.fromJSON(jsonResponse);
    } catch (err) {
      print('Problem with URI: $err');
    }
    return null;
  }
}
