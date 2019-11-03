///This class wrap the response from API without formatting
///
///
/// Sample data:
///
/// {
///   "results":
///   {
///     "sunrise":"2015-05-21T05:05:35+00:00",
///     "sunset":"2015-05-21T19:22:59+00:00",
///     "solar_noon":"2015-05-21T12:14:17+00:00",
///     "day_length":51444,
///     "civil_twilight_begin":"2015-05-21T04:36:17+00:00",
///     "civil_twilight_end":"2015-05-21T19:52:17+00:00",
///     "nautical_twilight_begin":"2015-05-21T04:00:13+00:00",
///     "nautical_twilight_end":"2015-05-21T20:28:21+00:00",
///     "astronomical_twilight_begin":"2015-05-21T03:20:49+00:00",
///     "astronomical_twilight_end":"2015-05-21T21:07:45+00:00"
///   },
///    "status":"OK"
/// }
///
///
///
///
class SunriseSunsetData {
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime solarNoon;

  ///Expressed in seconds
  final int dayLength;
  final DateTime civilTwilightBegin;
  final DateTime civilTwilightEnd;
  final DateTime nauticalTwilightBegin;
  final DateTime nauticalTwilightEnd;
  final DateTime astronomicalTwilightBegin;
  final DateTime astronomicalTwilightEnd;

  SunriseSunsetData._({
    this.sunrise,
    this.sunset,
    this.solarNoon,
    this.dayLength,
    this.civilTwilightBegin,
    this.civilTwilightEnd,
    this.nauticalTwilightBegin,
    this.nauticalTwilightEnd,
    this.astronomicalTwilightBegin,
    this.astronomicalTwilightEnd,
  });

  factory SunriseSunsetData.fromJSON(Map json) {
    return SunriseSunsetData._(
      sunrise: DateTime.parse(
        json["sunrise"],
      ),
      sunset: DateTime.parse(
        json["sunset"],
      ),
      solarNoon: DateTime.parse(
        json["solar_noon"],
      ),
      civilTwilightBegin: DateTime.parse(
        json["civil_twilight_begin"],
      ),
      civilTwilightEnd: DateTime.parse(
        json["civil_twilight_end"],
      ),
      nauticalTwilightBegin: DateTime.parse(
        json["nautical_twilight_begin"],
      ),
      nauticalTwilightEnd: DateTime.parse(
        json["nautical_twilight_end"],
      ),
      astronomicalTwilightBegin: DateTime.parse(
        json["astronomical_twilight_begin"],
      ),
      astronomicalTwilightEnd: DateTime.parse(
        json["astronomical_twilight_end"],
      ),
      dayLength: json["day_length"],
    );
  }
}
