import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ResourcePersonModel {
  String name;
  String email;
  String pwd;
  String mobile;
  String designation;
  String currCompany;
  String prevCompany;
  String industry;
  String subDomain;
  String firstSkill;
  String secondSkill;
  String thirdSkill;
  int carrier;
  int referral;
  String imageUrl;
  String resumeUrl;
  String linkedIn;
  String proofUrl;

  resourcePersonMap() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['email'] = email;
    map['pass'] = pwd;
    map['mobile'] = mobile;
    map['designation'] = designation;
    map['currCompany'] = currCompany;
    map['preCompany'] = prevCompany;
    map['industry'] = industry;
    map['subdomain'] = subDomain;
    map['skill1'] = firstSkill;
    map['skill2'] = secondSkill;
    map['skill3'] = thirdSkill;
    map['carrier'] = carrier;
    map['referral'] = referral;
    map['imageURL'] = imageUrl;
    map['linkedIn'] = resumeUrl;
    map['resumeURL'] = linkedIn;
    map['proof'] = proofUrl;

    return map;
  }
}
