import './sunrise_sunset_data.dart';

class SunriseSunsetResponse {
  final SunriseSunsetData data;
  final bool success;
  final String error;

  SunriseSunsetResponse({
    this.data,
    this.success,
    this.error,
  });

  factory SunriseSunsetResponse.fromJSON(Map json) {
    final status = json["status"];
    final results = json["results"];
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

    return SunriseSunsetResponse(
      data: errorMessage.isEmpty ? SunriseSunsetData.fromJSON(results) : null,
      error: errorMessage,
      success: errorMessage?.isEmpty,
    );
  }
}
