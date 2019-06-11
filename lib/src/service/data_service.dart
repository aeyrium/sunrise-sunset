import 'dart:convert';
import '../../sunrise_sunset.dart';
import './options.dart';
import 'package:http/http.dart' as http;

abstract class DataRepository {
  Future<SunriseSunsetResponse<T>> serverRequest<T>(
    Options options,
  );
}

class DataService implements DataRepository {
  /// HTTP network requests protocols.
  Future<SunriseSunsetResponse<T>> serverRequest<T>(
    Options options,
  ) async {
    Map<String, dynamic> queryParams = options.toQueryParams();

    Uri uri = Uri(
      scheme: 'https',
      host: '/api.sunrise-sunset.org',
      path: '/json',
      queryParameters: queryParams,
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
    return parseData(jsonResponse, options);
  }
}

SunriseSunsetResponse parseData<T>(jsonResponse, Options options) {
  final status = jsonResponse["status"];
  final results = jsonResponse["results"];
  String errorMessage = "";

  if (status == "OK") {
  } else if (status == "INVALID_REQUEST") {
    errorMessage = "lat or lng parameters are missing or invalid";
  } else if (status == "INVALID_DATE") {
    errorMessage = "date parameter is missing or invalid";
  } else {
    errorMessage =
        "the request could not be processed due to a server error. The request may succeed if you try again";
  }

  if (options.formatted) {
    return SunriseSunsetResponse<SunriseSunsetDataFormatted>(
      data: errorMessage.isEmpty
          ? SunriseSunsetDataFormatted.fromJSON(results)
          : null,
      error: errorMessage,
      success: errorMessage.isEmpty,
    );
  } else {
    return SunriseSunsetResponse<SunriseSunsetData>(
      data: errorMessage.isEmpty ? SunriseSunsetData.fromJSON(results) : null,
      error: errorMessage,
      success: errorMessage.isEmpty,
    );
  }
}

class SunriseSunsetResponse<T> {
  final T data;
  final bool success;
  final String error;

  SunriseSunsetResponse({
    this.data,
    this.success,
    this.error,
  });
}
