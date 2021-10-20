import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_uuid/get_uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _uuid = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String uuid;
    try {
      uuid = await GetUuid.getUuid() ?? 'Get uuid failed';
    } on PlatformException {
      uuid = 'Failed to get device uuid.';
    }

    if (!mounted) return;

    setState(() {
      _uuid = uuid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get UUID Example'),
        ),
        body: Center(
          child: Text('Get uuid: $_uuid\n'),
        ),
      ),
    );
  }
}
