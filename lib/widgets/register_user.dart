import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function onLogInSelected;

  SignUp({@required this.onLogInSelected});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          color: Colors.black,
          shadowColor: Colors.purple[200],
          elevation: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 500,
            color: Colors.black,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 200,
                        child: Divider(
                          color: Colors.purple[800],
                          thickness: 2,
                          height: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
//                        onChanged: (val) {
//                          setState(() => email = val);
//                        },
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "Name",
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                        ),
                        maxLines: 1,
                        //controller: _usernameControl,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
//                        onChanged: (val) {
//                          setState(() => email = val);
//                        },
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.black,
                          ),
                        ),
                        maxLines: 1,
                        //controller: _usernameControl,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
//                        onChanged: (val) {
//                          setState(() => email = val);
//                        },
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          ),
                        ),
                        maxLines: 1,
                        //controller: _usernameControl,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
//                        onChanged: (val) {
//                          setState(() => email = val);
//                        },
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "Mobile",
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(
                            Icons.call,
                            color: Colors.black,
                          ),
                        ),
                        maxLines: 1,
                        //controller: _usernameControl,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      RaisedButton(
                        child: Text("Go Ahead".toUpperCase()),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.onLogInSelected();
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
