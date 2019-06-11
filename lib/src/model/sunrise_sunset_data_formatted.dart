///This class wrap the response from API formatted
///
///
/// Sample data:
///
/// {
///   "results":
///   {
///     "sunrise":"7:27:02 AM",
///     "sunset":"5:05:55 PM",
///     "solar_noon":"12:16:28 PM",
///     "day_length":"9:38:53",
///     "civil_twilight_begin":"6:58:14 AM",
///     "civil_twilight_end":"5:34:43 PM",
///     "nautical_twilight_begin":"6:25:47 AM",
///     "nautical_twilight_end":"6:07:10 PM",
///     "astronomical_twilight_begin":"5:54:14 AM",
///     "astronomical_twilight_end":"6:38:43 PM"
///   },
///    "status":"OK"
/// }
///
///
///
///
class SunriseSunsetDataFormatted {
  final String sunrise;
  final String sunset;
  final String solarNoon;
  final String dayLength;
  final String civilTwilightBegin;
  final String civilTwilightEnd;
  final String nauticalTwilightBegin;
  final String nauticalTwilightEnd;
  final String astronomicalTwilightBegin;
  final String astronomicalTwilightEnd;

  SunriseSunsetDataFormatted._({
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

  factory SunriseSunsetDataFormatted.fromJSON(Map json) {
    return SunriseSunsetDataFormatted._(
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      solarNoon: json["solar_noon"],
      civilTwilightBegin: json["civil_twilight_begin"],
      civilTwilightEnd: json["civil_twilight_end"],
      nauticalTwilightBegin: json["nautical_twilight_begin"],
      nauticalTwilightEnd: json["nautical_twilight_end"],
      astronomicalTwilightBegin: json["astronomical_twilight_begin"],
      astronomicalTwilightEnd: json["astronomical_twilight_end"],
      dayLength: json["day_length"],
    );
  }
}
