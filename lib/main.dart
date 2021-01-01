import 'package:flutter/material.dart';

import 'package:taskc/taskc.dart' as taskc;

import 'helper_functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter prototype to test taskd setup'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  taskc.Connection _connection;
  taskc.Credentials _credentials;
  Map _stats;

  Future<void> _getStatistics() async {
    _connection = await getConnection(context);
    _credentials = await getCredentials(context);
    var result = await taskc.statistics(
      connection: _connection,
      credentials: _credentials,
    );
    _stats = result.header;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Statistics are:',
            ),
            if (_stats == null)
              Text(
                '$_stats',
                style: Theme.of(context).textTheme.headline4,
              )
            else
              for (var entry in _stats.entries)
                Text(
                  '${entry.key}: ${entry.value}',
                  style: Theme.of(context).textTheme.headline4,
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getStatistics,
        tooltip: 'Statistics',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
