import 'package:flutter/material.dart';

import 'api.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Api api;
  TextEditingController _messageController = TextEditingController();
  TextEditingController _hostController = TextEditingController();

  var res;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Spam Classification'),
        ),
        body: Column(
          children: [

            TextFormField(
              controller: _hostController,
              decoration: InputDecoration(hintText: 'Host Ip..'),
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(hintText: 'Message..'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                api = Api(host: _hostController.text.trim());
                if (_messageController.text.length > 3) {
                  res = await api.predictText(_messageController.text);

                  setState(() {
                    res = res;
                  });
                }
              },
              child: Text('submit'),
            ),
            SizedBox(height: 50),
            Text(res.toString())
          ],
        ),
      ),
    );
  }
}
