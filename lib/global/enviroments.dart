import 'dart:io';

import 'package:flutter/foundation.dart';

class Enviroments {
  static String apiUrlUser = kIsWeb
      ? 'http://localhost:8080/user'
      : Platform.isAndroid
          ? 'http://10.0.2.2:8080/user'
          : 'http://localhost:8080/user';

  static String apiUrl = kIsWeb
      ? 'http://localhost:8080'
      : Platform.isAndroid
          ? 'http://10.0.2.2:8080'
          : 'http://localhost:8080';
}
