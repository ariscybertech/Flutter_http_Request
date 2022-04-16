import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;
import 'data_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DataModel> model;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Get Request'),
      ),
      body: model == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ExpansionTile(
                    title: Text(model[index].channel_name),
                    children: [Text(model[index].channel_description)],
                  ),
                );
              },
              itemCount: model.length,
            ),
    );
  }

  Future<void> getData() async {
    Uri url = Uri.https('py.dwed.biz', '/v1.0/api/streaming/movie_tv/');
    http.Response res = await http.get(url);
    print(res.body);
    List<dynamic> body = cnv.jsonDecode(res.body);
    model = body.map((dynamic item) => DataModel.fromJson(item)).toList();
    setState(() {});
  }
}
