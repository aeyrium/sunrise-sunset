# Sunrise Sunset

Dart API that provides sunset and sunrise times for a given latitude and longitude.  This API is a wrapper around the 
free [Sunset and Sunrise Times API](https://sunrise-sunset.org/)

![Phases of the sun and moon](https://sunrise-sunset.org/graph.svg)

## Getting started

You should ensure that you add the dependency in your project.
```yaml
dependencies:
 sunrise_sunset: "^1.0.2"
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

To use simply call the static method `SunriseSunset.getResults(...)`.

Time values in response will be expressed `Datetime` instances and `day_length` will be expressed in seconds.

```
 final response = await SunriseSunset.getResults(date: DateTime.now(), latitude: 36.7201600, longitude: -4.4203400);
```




