# Sunrise Sunset
Dart API that provides sunset and sunrise times for a given latitude and longitude

## Getting started

You should ensure that you add the dependency in your project.
```yaml
dependencies:
 sunrise_sunset: "^1.0.0"
```

You should then run `flutter packages upgrade` or update your packages in IntelliJ.

## Parameters

 | Name          | Optional                                                | 
 |---------------|---------------------------------------------------------|
 | latitude      | No                                                      | 
 | longitude     | No                                                      | 
 | date          | Yes (If not present, date defaults to current date)     | 



## Usage

Import the file:

```
import 'package:sunrise_sunset/sunrise_sunset.dart';
```

There are two methods to get the results , one is `getResults` , Time values in response will be expressed following ISO 8601 and day_length will be expressed in seconds.

```
 final api = SunriseSunset();
 final response = await api.getResults(date: DateTime.now(), latitude: 36.7201600, longitude: -4.4203400);
```

The second method is `getFormattedResults` , Time values in response will be formatted and expresed in `String`.

```
 final api = SunriseSunset();
 final response = await api.getFormattedResults(latitude: 36.7201600, longitude: -4.4203400);
```



