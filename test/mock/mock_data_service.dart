import 'package:sunrise_sunset/src/service/data_service.dart';
import 'package:sunrise_sunset/src/service/options.dart';

class MockDataService implements DataRepository {
  Map data = mock0;

  @override
  Future<SunriseSunsetResponse<T>> serverRequest<T>(Options options) async {
    return parseData(data, options);
  }
}

//OK formatted results
Map mock0 = {
  "results": {
    "sunrise": "7:27:02 AM",
    "sunset": "5:05:55 PM",
    "solar_noon": "12:16:28 PM",
    "day_length": "9:38:53",
    "civil_twilight_begin": "6:58:14 AM",
    "civil_twilight_end": "5:34:43 PM",
    "nautical_twilight_begin": "6:25:47 AM",
    "nautical_twilight_end": "6:07:10 PM",
    "astronomical_twilight_begin": "5:54:14 AM",
    "astronomical_twilight_end": "6:38:43 PM"
  },
  "status": "OK"
};

//OK no formatted results
Map mock1 = {
  "results": {
    "sunrise": "2015-05-21T05:05:35+00:00",
    "sunset": "2015-05-21T19:22:59+00:00",
    "solar_noon": "2015-05-21T12:14:17+00:00",
    "day_length": 51444,
    "civil_twilight_begin": "2015-05-21T04:36:17+00:00",
    "civil_twilight_end": "2015-05-21T19:52:17+00:00",
    "nautical_twilight_begin": "2015-05-21T04:00:13+00:00",
    "nautical_twilight_end": "2015-05-21T20:28:21+00:00",
    "astronomical_twilight_begin": "2015-05-21T03:20:49+00:00",
    "astronomical_twilight_end": "2015-05-21T21:07:45+00:00"
  },
  "status": "OK"
};

//INVALID_REQUEST
Map mock2 = {"status": "INVALID_REQUEST"};

//INVALID_DATE
Map mock3 = {"status": "INVALID_DATE"};

//UNKNOWN_ERROR
Map mock4 = {"status": "UNKNOWN_ERROR"};
