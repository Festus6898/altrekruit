import 'package:flutter/material.dart';
import 'package:mera_app/assets.dart';
import 'package:mera_app/datatemp/constants.dart';
import 'package:mera_app/screens/screens.dart';
import 'package:mera_app/widgets/widgets.dart';

class LoginResourceScreen extends StatefulWidget {
  @override
  _LoginResourceScreenState createState() => _LoginResourceScreenState();
}

class _LoginResourceScreenState extends State<LoginResourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _LoginMobile(),
      desktop: _LoginDesktop(),
    );
  }
}

class _LoginMobile extends StatefulWidget {
  @override
  __LoginMobileState createState() => __LoginMobileState();
}

class __LoginMobileState extends State<_LoginMobile> {
  Option selectedOption = Option.Signup;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            //Background
            Container(
              height: double.infinity,
              width: size.width,
              color: Colors.black,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),

                //Animation 1
//              transitionBuilder: (widget, animation) => RotationTransition(
//                turns: animation,
//                child: widget,
//              ),
//              switchOutCurve: Curves.easeInOutCubic,
//              switchInCurve: Curves.fastLinearToSlowEaseIn,

                //Animation 2
                transitionBuilder: (widget, animation) => ScaleTransition(
                  scale: animation,
                  child: widget,
                ),

                child: selectedOption == Option.LogIn
                    ? LogInRP(
                        onSignUpSelected: () {
                          setState(() {
                            selectedOption = Option.Signup;
                          });
                        },
                      )
                    : SignUpRP(
                        onLogInSelected: () {
                          setState(() {
                            selectedOption = Option.LogIn;
                          });
                        },
                      ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "altREKRUIT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Dream Job, Your Way!!!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InitialNavigateScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginDesktop extends StatefulWidget {
  @override
  _LoginDesktopState createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<_LoginDesktop> {
  Option selectedOption = Option.Signup;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            //Background
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: Colors.black,
                  child: Image.asset(
                    Assets.login1,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: Colors.black,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),

                    //Animation 1
//              transitionBuilder: (widget, animation) => RotationTransition(
//                turns: animation,
//                child: widget,
//              ),
//              switchOutCurve: Curves.easeInOutCubic,
//              switchInCurve: Curves.fastLinearToSlowEaseIn,

                    //Animation 2
                    transitionBuilder: (widget, animation) => ScaleTransition(
                      scale: animation,
                      child: widget,
                    ),

                    child: selectedOption == Option.LogIn
                        ? LogInRP(
                            onSignUpSelected: () {
                              setState(() {
                                selectedOption = Option.Signup;
                              });
                            },
                          )
                        : SignUpRP(
                            onLogInSelected: () {
                              setState(() {
                                selectedOption = Option.LogIn;
                              });
                            },
                          ),
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "altREKRUIT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Dream Job, Your Way!!!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InitialNavigateScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
