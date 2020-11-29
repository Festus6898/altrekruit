import 'package:mera_app/assets.dart';
import 'package:mera_app/models/content_model.dart';
import 'package:flutter/material.dart';
import 'package:mera_app/models/rp_model.dart';

final Content splashContent = Content(
  name: 'Sintel',
  imageUrl: Assets.sintel,
  titleImageUrl: Assets.sintelTitle,
  videoUrl: Assets.sintelVideoUrl,
  description: 'Dream Job, Your Way',
);
final List<String> industryDrop = ['Software/IT', 'Finance', 'Others'];
final List<String> subDomainDrop = [
  'Fullstack Developer',
  'UI Developer',
  'API Developer',
  'Graphic Designer',
  'Cloud Architect',
  'AI/ML Architect',
  'VR/AR Developer'
];
final List<String> skillSet = [
  'HTML',
  'CSS',
  'bootstrap',
  'Javascript',
  'photoshop',
  'illustrator',
  'flutter',
  'dart',
  'vue.js',
];
final List<ResourcePerson> previews = [
  ResourcePerson(
    name: 'Meimozhi',
    imageUrl: Assets.user1,
    color: Colors.orange,
    designation: 'Product Head',
  ),
  ResourcePerson(
    name: 'Manimozhi',
    imageUrl: Assets.user2,
    color: Colors.red,
    designation: 'Technical Head',
  ),
  ResourcePerson(
    name: 'Karthika',
    imageUrl: Assets.user3,
    color: Colors.yellow,
    designation: 'Sales Head',
  ),
  ResourcePerson(
    name: 'Mohan Kumaar',
    imageUrl: Assets.user4,
    color: Colors.lightBlueAccent,
    designation: 'Product Manager',
  ),
  ResourcePerson(
    name: 'Festus',
    imageUrl: Assets.user5,
    color: Colors.green,
    designation: 'Project Manager',
  ),
];

final List<Content> myList = const [
  Content(
      name: 'Chakravarthi',
      imageUrl: Assets.testimony1,
      description:
          'The services provided are useful in a long run,\nwhich makes way for my enhancement in\nthe domain that I love.'),
  Content(
      name: 'Nethaji',
      imageUrl: Assets.testimony2,
      description:
          'Referral System was on point and the resource\nperson was helpful in building my profile\ntowards a better Carrier.'),
  Content(
      name: 'Ajay',
      imageUrl: Assets.testimony3,
      description:
          'The transparency, availability, accessibity of this site is\nso user-friendly that this can be suggested to others also.\nThe end result is always Positive.'),
];
//
final List<Content> originals = const [
  Content(
      name: 'What defines AltReKruit?',
      description:
          'AltRekruit is the platform for the freshers and Job seekers who wants referral and guidance to shape up their carrier.'),
  Content(
      name: 'As a resource person, how would I be satisfied?',
      description:
          'Since Resource Person would be our major player, Resource Person will be duly paid for the referrals he make after submitting the proof for the same.'),
  Content(
      name: 'As a Fresher, what should I do to get a job through this website?',
      description:
          'For Freshers, the options for the referral would be minimal as most reputed firms do not go for it. But still he/she can get job through our Job Portal.'),
  Content(
      name: 'What are the ways of getting Career advice?',
      description:
          'Carrier advice is an add on festure that lets user to get knowledge about the carrier path and approach towards the same from people who tasted success in that path.'),
  Content(
      name: 'For how long referral would be valid',
      description:
          'The validity of the referral will vary for different firms and the same goes for the validity period also. Kindly get the information of this through Resource Person.'),
];
//
//final List<Content> trending = const [
//  Content(name: 'Explained', imageUrl: Assets.explained),
//  Content(name: 'Avatar The Last Airbender', imageUrl: Assets.atla),
//  Content(name: 'Tiger King', imageUrl: Assets.tigerKing),
//  Content(name: 'The Crown', imageUrl: Assets.crown),
//  Content(name: 'Dogs', imageUrl: Assets.dogs),
//  Content(name: 'Explained', imageUrl: Assets.explained),
//  Content(name: 'Avatar The Last Airbender', imageUrl: Assets.atla),
//  Content(name: 'Tiger King', imageUrl: Assets.tigerKing),
//  Content(name: 'The Crown', imageUrl: Assets.crown),
//  Content(name: 'Dogs', imageUrl: Assets.dogs),
//];
