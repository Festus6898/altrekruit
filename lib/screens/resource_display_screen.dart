import 'dart:convert';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ResourceDisplayScreen extends StatefulWidget {
  @override
  _ResourceDisplayScreenState createState() => _ResourceDisplayScreenState();
}

class _ResourceDisplayScreenState extends State<ResourceDisplayScreen> {
  String _mySelection;
  List _dataProvince = List(); //edited line
  final String url =
      "https://cors-anywhere.herokuapp.com/https://altrekruit.com/api/names";
  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      _dataProvince = resBody;
      print(_dataProvince);
    });

    print(resBody);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    getSWData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new DropdownButton(
          hint: Text("Select Province"),
          value: _mySelection,
          items: _dataProvince.map((item) {
            return DropdownMenuItem(
              child: Text(item),
              value: item,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _mySelection = value;
            });
          },
        ),
      ),
    );
  }
}
