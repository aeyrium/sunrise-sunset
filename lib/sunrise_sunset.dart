library sunrise_sunset;

export 'src/model/sunrise_sunset_data_formatted.dart';
export 'src/model/sunrise_sunset_data.dart';

import 'src/service/data_service.dart';
import 'src/service/options.dart';
import 'src/model/sunrise_sunset_data_formatted.dart';
import 'src/model/sunrise_sunset_data.dart';

class SunriseSunset {
  static SunriseSunset _instance;
  final DataRepository _dataService;

  factory SunriseSunset({DataRepository dataService}) {
    return _instance ?? SunriseSunset._internal(dataService ?? DataService());
  }

  SunriseSunset._internal(
    DataRepository dataService,
  ) : _dataService = dataService;

  /// Get results from the Sunrise Sunset API ,
  /// Time values in response will be expressed following ISO 8601 and day_length will be expressed in seconds
  Future<SunriseSunsetResponse<SunriseSunsetData>> getResults({
    DateTime date,
    double latitude,
    double longitude,
  }) async {
    return _dataService.serverRequest(
      Options(
        date: date,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  /// Get results from the Sunrise Sunset API ,
  /// Time values in response will be formatted
  Future<SunriseSunsetResponse<SunriseSunsetDataFormatted>>
      getFormattedResults({
    DateTime date,
    double latitude,
    double longitude,
  }) {
    return _dataService.serverRequest(
      Options(
        date: date,
        latitude: latitude,
        longitude: longitude,
        formatted: true,
      ),
    );
  }
}
