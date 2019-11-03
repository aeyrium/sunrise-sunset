///Options we use as params to the web service

class Options {
  /// [Optional] Date for which we want to obtain the API data.
  /// If it's null then we use the current date
  final DateTime date;

  final double latitude;

  final double longitude;

  ///[true] if we want the response from the API very well formatted.
  final bool formatted;

  Options({
    DateTime date,
    double latitude,
    double longitude,
    this.formatted = false,
  })  : this.date = date ?? DateTime.now(),
        this.latitude = _checkLatitude(latitude),
        this.longitude = _checkLongitude(longitude),
        assert(formatted != null);

  Map<String, dynamic> toQueryParams() {
    Map<String, dynamic> params = {};
    params['lat'] = latitude;
    params['lon'] = longitude;
    //DateFormat : yyyy-MM-dd
    params['date'] = "${date.year}-${date.month}-${date.day}";
    params['formatted'] = formatted ? '1' : '0';
    return params;
  }

  static double _checkLongitude(double longitude) {
    if (longitude != null && longitude >= -180.0 && longitude <= 180.0)
      return longitude;
    throw ArgumentError("Invalid longitude value of $longitude.");
  }

  static double _checkLatitude(double latitude) {
    if (latitude != null && latitude >= -180.0 && latitude <= 180.0)
      return latitude;
    throw ArgumentError("Invalid latitude value of $latitude.");
  }
}
