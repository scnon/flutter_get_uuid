import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_uuid/get_uuid.dart';

void main() {
  const MethodChannel channel = MethodChannel('get_uuid');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getUuid', () async {
    expect(await GetUuid.getUuid(), '42');
  });
}
