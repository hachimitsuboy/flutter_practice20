import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform = MethodChannel("battery");
  String _batteryLevel = 'バッテリー残量不明';

  Future<void> _getBatteryLevel(String s) async {
    print("押された");
    String batteryLevel;
    try {
      final String result = await platform.invokeMethod(s);
      batteryLevel = result;
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("バッテリー残量"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: Center(child: Text(_batteryLevel)),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _getBatteryLevel("getBatteryLevel"),
                  child: const Text("バッテリー残量を取得"),
                ),
                const SizedBox(width: 30),
                ElevatedButton(onPressed: () => _getBatteryLevel("hello"), child: const Text("挨拶"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
