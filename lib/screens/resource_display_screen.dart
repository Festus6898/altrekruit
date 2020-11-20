import 'package:flutter/material.dart';
import 'package:mera_app/widgets/widgets.dart';

class ResourceDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: CustomAppBar(),
        ),
        body: Container(
          child: Center(
              child: Text("Resource Person Details Shown here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ))),
        ));
  }
}
