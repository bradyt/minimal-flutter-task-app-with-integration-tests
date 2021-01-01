import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:taskd_setup/main.dart' as app;

void main() {
  enableFlutterDriverExtension();

  runApp(DefaultAssetBundle(
    bundle: TestAssetBundle(),
    child: app.MyApp(),
  ));
}

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final ByteData data = await load(key);
    if (data == null) throw FlutterError('Unable to load asset');
    return utf8.decode(data.buffer.asUint8List());
  }

  @override
  Future<ByteData> load(String key) async => rootBundle.load(key);
}
