import 'dart:async';

import 'package:flutter/services.dart';

class GetUuid {
  static const MethodChannel _channel = MethodChannel('get_uuid');

  static Future<String?> getUuid() async {
    return await _channel.invokeMethod('getUuid');
  }
}
