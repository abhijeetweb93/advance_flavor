import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  static const platform = MethodChannel('flavor_channel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<dynamic>(
                future: platform.invokeMethod("getFlavor"),
                builder: (contexts, snap) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("You are running '${snap.data}' build" ?? "hhi"),
                  );
                }),

            FutureBuilder<dynamic>(
                future: platform.invokeMethod("getDeviceID"),
                builder: (contexts, snap) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("You device id is '${snap.data}'" ?? "hhi"),
                  );
                }),
            FutureBuilder<dynamic>(
                future: platform.invokeMethod("getApplicationID"),
                builder: (contexts, snap) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("You Application id is '${snap.data}'" ?? "hhi"),
                  );
                }),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}