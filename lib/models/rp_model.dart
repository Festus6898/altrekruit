import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ResourcePerson {
  final String name;
  final String imageUrl;
  final String designation;
  final String company;
  final String industry;
  final String techSkills;
  final String mappedAs;
  final String linkedInId;
  final String emailId;
  final Color color;

  ResourcePerson({
    @required this.name,
    @required this.imageUrl,
    this.designation,
    this.company,
    this.industry,
    this.techSkills,
    this.mappedAs,
    this.emailId,
    this.linkedInId,
    this.color,
  });
}
