import 'dart:convert';
import 'dart:html';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:mera_app/models/resourceperson.dart';
import 'package:mera_app/screens/screens.dart';
import 'package:http/http.dart' as http;
import 'package:firebase/firebase.dart' as fb;
import 'package:mera_app/datatemp/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  var _categoriesSubDomainDrop = List<DropdownMenuItem>();
  var _selectedIndustry;
  var _selectedDomain;
  var _selectedSkill1;
  var _selectedSkill2;
  var _selectedSkill3;
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
        _categoriesSubDomainDrop.add(DropdownMenuItem(
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
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessScreen()),
        );
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Message"),
      content: Text("User Created Successfully"),
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
                          hintText: "Enter Designation",
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
                          hintText: "Enter Company",
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Previous Workplace",
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
                        controller: preCompany,
                        decoration: InputDecoration(
                          labelText: "Previous Company",
                          hintText: "Enter Company",
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Industrial Category",
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
                      DropdownButtonFormField(
                        value: _selectedIndustry,
                        items: _categoriesIndustryDrop,
                        hint: Text("Select a category"),
                        onChanged: (value) {
                          setState(() {
                            _selectedIndustry = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Domain Expertise",
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
                      DropdownButtonFormField(
                        value: _selectedDomain,
                        items: _categoriesSubDomainDrop,
                        hint: Text("Select your Domain"),
                        onChanged: (value) {
                          setState(() {
                            _selectedDomain = value;
                          });
                        },
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
                              Navigator.pop(context);
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
                            onPressed: () {
                              if (designation.text.isEmpty ||
                                  email.text.isEmpty ||
                                  currCompany.text.isEmpty ||
                                  _selectedIndustry.toString().isEmpty ||
                                  _selectedDomain.toString().isEmpty) {
                                return showAlertDialog(context);
                              } else {
                                _resourcePerson.designation = designation.text;
                                _resourcePerson.currCompany = currCompany.text;
                                _resourcePerson.prevCompany = preCompany.text;
                                _resourcePerson.industry = _selectedIndustry;
                                _resourcePerson.subDomain = _selectedDomain;
                                print(_resourcePerson.designation +
                                    "||" +
                                    _resourcePerson.currCompany +
                                    "||" +
                                    _resourcePerson.prevCompany +
                                    "||" +
                                    _resourcePerson.subDomain +
                                    "||" +
                                    _resourcePerson.industry);
                                Navigator.pop(context);
                                return _showPreferenceDialog(context);
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

  _showPreferenceDialog(BuildContext context) {
    List<String> skills = _dataProvince.cast<String>();
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          // StatefulBuilder
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 500.0,
                width: 500.0,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Valuating the Preferences",
                          style: TextStyle(
                            color: Colors.purple[800],
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Key Skills",
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
                        SizedBox(
                          height: 5.0,
                        ),
                        DropDownField(
                          onValueChanged: (dynamic value) {
                            _selectedSkill1 = value;
                          },
                          itemsVisibleInDropdown: 2,
                          value: _selectedSkill1,
                          required: false,
                          hintText: 'Select Skill',
                          labelText: '1st Skill',
                          items: skills.toList(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        DropDownField(
                          itemsVisibleInDropdown: 2,
                          onValueChanged: (dynamic value) {
                            _selectedSkill2 = value;
                          },
                          value: _selectedSkill2,
                          required: false,
                          hintText: 'Select Skill',
                          labelText: '2nd Skill',
                          items: skills.toList(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        DropDownField(
                          onValueChanged: (dynamic value) {
                            _selectedSkill3 = value;
                          },
                          itemsVisibleInDropdown: 2,
                          value: _selectedSkill3,
                          required: false,
                          hintText: 'Select Skill',
                          labelText: '3rd Skill',
                          items: skills.toList(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Would you like to give carrier advice or webinar to students in future?",
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
                        SizedBox(
                          height: 20.0,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: testRadio,
                          title: Text("Yes"),
                          onChanged: (int value) {
                            setState(() {
                              testRadio = value;
                            });
                          },
                        ),
                        RadioListTile(
                          value: 2,
                          groupValue: testRadio,
                          title: Text("No"),
                          onChanged: (int value) {
                            setState(() {
                              testRadio = value;
                              print(testRadio);
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Is Referral System allowed in your workplace and you are willing to refer people?",
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
                        SizedBox(
                          height: 20.0,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: testRadio1,
                          title: Text("Yes"),
                          onChanged: (int value) {
                            setState(() {
                              testRadio1 = value;
                            });
                          },
                        ),
                        RadioListTile(
                          value: 2,
                          groupValue: testRadio1,
                          title: Text("No"),
                          onChanged: (int value) {
                            setState(() {
                              testRadio1 = value;
                            });
                          },
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
                                Navigator.pop(context);
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
                              onPressed: () {
                                if (_selectedSkill1 == _selectedSkill2 ||
                                    _selectedSkill1 == _selectedSkill3 ||
                                    _selectedSkill2 == _selectedSkill3) {
                                  showAlertDialog(context);
                                } else {
                                  Navigator.pop(context);
                                  _showSocialDialog(context);
                                  _resourcePerson.firstSkill = _selectedSkill1;
                                  _resourcePerson.secondSkill = _selectedSkill2;
                                  _resourcePerson.thirdSkill = _selectedSkill3;
                                  if (testRadio == 1)
                                    _resourcePerson.carrier = 1;
                                  else
                                    _resourcePerson.carrier = 0;
                                  if (testRadio1 == 1)
                                    _resourcePerson.referral = 1;
                                  else
                                    _resourcePerson.referral = 0;
                                  print("Carrier: " +
                                      _resourcePerson.carrier.toString() +
                                      " Referral: " +
                                      _resourcePerson.referral.toString());
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
          },
        );
      },
    );
  }

  _showSocialDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 500,
                width: 500,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Picture",
                        style: TextStyle(
                          color: Colors.purple[800],
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 20.0,
                          child: Icon(
                            Icons.people_alt_rounded,
                          ),
                          backgroundColor: _checkColor,
                          //backgroundImage: NetworkImage(""),
                        ),
                        onTap: () {
                          String value = uploadToStorageImage("testProfile");
                          print(value);
                          if (value.isNotEmpty) {
                            setState(() {
                              _checkColor = Colors.green;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Resume",
                        style: TextStyle(
                          color: Colors.purple[800],
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 20.0,
                          child: Icon(
                            Icons.people_alt_rounded,
                          ),
                          backgroundColor: _checkColor1,
                          //backgroundImage: NetworkImage(""),
                        ),
                        onTap: () {
                          String value1 = uploadToStorageResume("testResume");
                          print(value1);
                          if (value1.toLowerCase() == "successresume") {
                            setState(() {
                              _checkColor1 = Colors.green;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "LinkedIn Profile",
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
                        controller: linkedIn,
                        decoration: InputDecoration(
                          labelText: "LinkedIN",
                          hintText: "Enter LinkedIN URL",
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () async {
                          if (linkedIn.text.isEmpty) {
                            showAlertDialog(context);
                          } else {
                            _resourcePerson.linkedIn = linkedIn.text;
                            print("Calling createUser");
                            String result = await createUser(_resourcePerson);
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
                ),
              ),
            );
          });
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
                          if (name.text.isEmpty ||
                              email.text.isEmpty ||
                              mobile.text.isEmpty ||
                              pwd.text.isEmpty) {
                            return showAlertDialog(context);
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
  final dateTime = DateTime.now().month.toString();
  final userId = name;
  final path = '$dateTime/$userId';
  print(path);
  uploadImage(
    onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://alt-hosting.appspot.com/')
          .child(path)
          .put(file);
    },
  );
  return path;
}

String uploadToStorageResume(String name) {
  final dateTime = DateTime.now().month.toString();
  final userId = name;
  final path = '$dateTime/$userId';
  print(path);
  uploadResume(
    onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://alt-hosting.appspot.com/')
          .child(path)
          .put(file)
          .future
          .then((_) {
        return null;
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
  if (response.statusCode == 200)
    return "Success";
  else
    return "Failed";
}
