import 'package:flutter/services.dart';

class NavigationHelper {
  static const MethodChannel _channel = MethodChannel('com.example.view_ref/navigation');

  static Future<bool> moveTaskToBack() async {
    try {
      final bool result = await _channel.invokeMethod('moveTaskToBack');
      return result;
    } on PlatformException catch (e) {
      print('Failed to move task to back: ${e.message}');
      return false;
    }
  }
}
