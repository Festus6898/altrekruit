import 'dart:convert';
import 'dart:html';
import 'package:flutter/services.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:mera_app/models/resourceperson.dart';
import 'package:mera_app/screens/screens.dart';
import 'package:http/http.dart' as http;
import 'package:firebase/firebase.dart' as fb;
import 'package:mera_app/datatemp/data.dart';
import 'package:email_validator/email_validator.dart';

class SignUpRP extends StatefulWidget {
  final Function onLogInSelected;

  SignUpRP({@required this.onLogInSelected});
  @override
  _SignUpRPState createState() => _SignUpRPState();
}

Color _checkColor = Colors.red;
Color _checkColor1 = Colors.red;

class _SignUpRPState extends State<SignUpRP> {
  bool testData = false;
  List _dataProvince = List();
  int testRadio = 0;
  int testRadio1 = 0;
  var _resourcePerson = ResourcePersonModel();
  var _categoriesIndustryDrop = List<DropdownMenuItem>();
  var _categoriesSubDomainDropIT = List<DropdownMenuItem>();
  var _selectedSkill1;
  var _selectedSkill2;
  var _selectedSkill3;
  var _skill1 = TextEditingController();
  var _skill2 = TextEditingController();
  var _skill3 = TextEditingController();
  var name = TextEditingController();
  var email = TextEditingController();
  var mobile = TextEditingController();
  var pwd = TextEditingController();
  var designation = TextEditingController();
  var currCompany = TextEditingController();
  var preCompany = TextEditingController();
  var industry = TextEditingController();
  var subDomain = TextEditingController();
  var linkedIn = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _loadDomainCategories();

    getSWData();
  }

  _loadCategories() async {
    industryDrop.forEach((category) {
      setState(() {
        _categoriesIndustryDrop.add(DropdownMenuItem(
          child: Text(category),
          value: category,
        ));
      });
    });
  }

  _loadDomainCategories() async {
    subDomainDrop.forEach((category) {
      setState(() {
        _categoriesSubDomainDropIT.add(DropdownMenuItem(
          child: Text(category),
          value: category,
        ));
      });
    });
  }

  Future<String> getSWData() async {
    final String url = "https://altrekruit.com/api/skills";
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    setState(() {
      _dataProvince = resBody;
    });

    return "Sucess";
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("All the * fields are MANDATORY"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showResultDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                height: 150.0,
                width: 400.0,
                child: Column(
                  children: [
                    Text(
                      "You have been successfully added to the AltReKruit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.purple[800],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessScreen()),
                        );
                      },
                    ),
                  ],
                )),
          );
        });
  }

  _showAlert(BuildContext context, String msg) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (msg == 'mail') {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  height: 150.0,
                  width: 400.0,
                  child: Column(
                    children: [
                      Text(
                        "Warning",
                        style: TextStyle(
                          color: Colors.purple[800],
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Enter a Valid Email address",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.purple[800],
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )),
            );
          } else {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  height: 150.0,
                  width: 400.0,
                  child: Column(
                    children: [
                      Text(
                        "Warning",
                        style: TextStyle(
                          color: Colors.purple[800],
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Enter all the mandatory fields",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      RaisedButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.purple[800],
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )),
            );
          }
        });
  }

  _showOccupationDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 500,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "WorkPlace Definition",
                          style: TextStyle(
                            color: Colors.purple[800],
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Designation",
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red[800],
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        controller: designation,
                        decoration: InputDecoration(
                          labelText: "Current Designation",
                          hintText: "Eg. Project Engineer",
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Current Workplace",
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red[800],
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        controller: currCompany,
                        decoration: InputDecoration(
                          labelText: "Current Company",
                          hintText: "Eg. Wipro Limited",
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Referral Code",
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "(if any)",
                            style: TextStyle(
                              color: Colors.red[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        controller: preCompany,
                        decoration: InputDecoration(
                          labelText: "Referral",
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.black)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginResourceScreen()),
                              );
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.purple[800],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.black)),
                            onPressed: () async {
                              if (designation.text.isEmpty ||
                                  currCompany.text.isEmpty) {
                                return _showAlert(context, 'empty');
                              } else {
                                _resourcePerson.designation = designation.text;
                                _resourcePerson.currCompany = currCompany.text;
                                _resourcePerson.prevCompany = preCompany.text;
                                _resourcePerson.industry = "";
                                _resourcePerson.subDomain = "";

                                print(_resourcePerson.designation +
                                    "||" +
                                    _resourcePerson.currCompany +
                                    "||" +
                                    _resourcePerson.prevCompany);
                                print("Calling createUser");
                                String result =
                                    await createUser(_resourcePerson);
                                print(result);
                                if (result.toLowerCase() == "success") {
                                  showResultDialog(context);
                                }
                              }
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.purple[800],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

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
          shadowColor: Colors.greenAccent[200],
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
                          color: Colors.greenAccent[200],
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
                          hintText: "Full Name*",
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
                        controller: name,
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
                          hintText: "Email*",
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
                        controller: email,
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
                          hintText: "Password*",
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
                        controller: pwd,
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
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                          hintText: "Mobile*",
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
                        controller: mobile,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      RaisedButton(
                        child: Text("Go Ahead".toUpperCase()),
                        color: Colors.white,
                        onPressed: () {
                          testData = EmailValidator.validate(email.text);
                          print(testData);
                          if (name.text.isEmpty ||
                              email.text.isEmpty ||
                              mobile.text.isEmpty ||
                              pwd.text.isEmpty) {
                            return _showAlert(context, 'empty');
                          } else if (testData == false) {
                            return _showAlert(context, 'mail');
                          } else {
                            _resourcePerson.name = name.text;
                            _resourcePerson.email = email.text;
                            _resourcePerson.mobile = mobile.text;
                            _resourcePerson.pwd = pwd.text;
                            return _showOccupationDialog(context);
                          }
                        },
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

String downloadUrl(String photoUrl) {
  var _currentUrl = fb
      .storage()
      .refFromURL('gs://alt-hosting.appspot.com/')
      .child(photoUrl)
      .getDownloadURL()
      .toString();
  print(_currentUrl);
  return _currentUrl;
}

void uploadImage({@required Function(File file) onSelected}) {
  InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files.first;
    final reader = FileReader();
    reader.readAsDataUrl(file);
    reader.onLoadEnd.listen((event) {
      onSelected(file);
      print(file.name);
    });
  });
}

void uploadResume({@required Function(File file) onSelected}) {
  InputElement uploadInput = FileUploadInputElement()
    ..accept = 'application/pdf';
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files.first;
    final reader = FileReader();
    reader.readAsDataUrl(file);
    reader.onLoadEnd.listen((event) {
      onSelected(file);
      print(file.name);
    });
  });
}

String uploadToStorageImage(String name) {
  final dateTime = DateTime.now();
  final userId = name;
  final path = '$userId/$dateTime';
  print(path);
  uploadImage(
    onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://alt-hosting.appspot.com/')
          .child(path)
          .put(file)
          .future
          .then((_) {
        print("Photo Upload Success");
        _checkColor = Colors.green;
      });
    },
  );
  return path;
}

String uploadToStorageResume(String name) {
  final dateTime = DateTime.now();
  final userId = name;
  final path = '$userId/$dateTime';
  //print(path);
  uploadResume(
    onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://alt-hosting.appspot.com/')
          .child(path)
          .put(file)
          .future
          .then((_) {
        print("File Upload Success");
        _checkColor1 = Colors.green;
      });
    },
  );
  return path;
}

Future<String> createUser(ResourcePersonModel resource) async {
  final String apiUrl = "https://altrekruit.com/api/createRP";
  //https://cors-anywhere.herokuapp.com/
  var body = json.encode(resource.resourcePersonMap());
  Map<String, String> headers = {"Content-type": "application/json"};
  print(body);
  print("Running Post API");
  final response =
      await http.post(Uri.encodeFull(apiUrl), body: body, headers: headers);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200)
    return "Success";
  else
    return "Failed";
}
