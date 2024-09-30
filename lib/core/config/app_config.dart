

import '../services/app_services.dart';

class AppConfig {
  static Map<String, String> header = {
    'Content-Type': 'application/json',
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${AppServices.localUserData?.token}",
  };
  static const String baseUrl = "https://project";
  static const String baseImageUrl = "https://project";
  static const String version = "v1";

}


