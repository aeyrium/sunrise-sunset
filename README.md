# Sunrise Sunset

[![Codemagic build status](https://api.codemagic.io/apps/5d0016e38576910010eb9b42/5d0016e38576910010eb9b41/status_badge.svg)](https://codemagic.io/apps/5d0016e38576910010eb9b42/5d0016e38576910010eb9b41/latest_build)

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

There are two methods to get the results , one is `getResults`.
Time values in response will be expressed following [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) and `day_length` will be expressed in seconds.

```
 final response = await SunriseSunset.getResults(date: DateTime.now(), latitude: 36.7201600, longitude: -4.4203400);
```




