import 'package:flutter/material.dart';
import 'package:mera_app/screens/screens.dart';
import 'package:mera_app/widgets/widgets.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _SuccessScreenMobile(),
      desktop: _SuccessScreenDesktop(),
    );
  }
}

class _SuccessScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Text(
                "You have become a part of ALTREKRUIT Family!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "The Market launch will be done on January 2021",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "Hope We Provide the best Environment",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black)),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigateScreen()),
                );
              },
              child: Text(
                "Click here to verify the upload",
                style: TextStyle(color: Colors.purple[800]),
              ),
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessScreenDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Text(
                "You have become a part of ALTREKRUIT Family!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "The Market launch will be done on January 2021",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "Hope We Provide the best Environment",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black)),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigateScreen()),
                );
              },
              child: Text(
                "Click here to verify the upload",
                style: TextStyle(color: Colors.purple[800]),
              ),
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
