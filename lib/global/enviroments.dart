import 'dart:io';

import 'package:flutter/foundation.dart';

class Enviroments {
  static String apiUrlUser = kIsWeb
      ? 'http://localhost:8090/user'
      : Platform.isAndroid
          ? 'http://10.0.2.2:8090/user'
          : 'http://localhost:8090/user';

  static String apiUrl = kIsWeb
      ? 'http://localhost:8090'
      : Platform.isAndroid
          ? 'http://10.0.2.2:8090'
          : 'http://localhost:8090';
}
