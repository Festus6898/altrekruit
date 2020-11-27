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
  'API Developer'
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
]; // angular.js, react, xamarin, c#, swift, dart API, kotlin, java, python, rust, node.js, php, typescript, c/c++, ruby, rust, MySQL, PostgreSQL, MS SQL Server, SQLite, MongoDB, Redis, MariaDB, Oracle, Elasticsearch, Firebase, DynamoDB, Cassandra, Couchbase, data science, data analysis, numpy , pandas, matlab, potly, seaborn, deeplearning, keras, pytorch, scala, pytorch, tensorflow, spark, hive, hadoop, tableu, qlickview, dash, reinforcement learning, GuriVR, OpenSpace3D, Google's ARCore, Holokit, ApertusVr, A-Frame, Lovr, cisco, routing, vpn, OSPF, switches, Cisco products, border gateway protocol, Network engineering, penetration testing, ddos, linux, unix, information security, Firewalls, cybersecurity, aws, gcp, azure, oracle, salesforce, ibm, agile, scrum, kanban, story telling, microsoft office, sql, business analysis];
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
          'Wyatt then warned that “he” never forgets,\nimplying that the Fiend was coming for payback.\nIt was a good, simple setup that used the funhouse\nto tie in an issue from several years ago,\nmaking this rivalry immediately more personal\nand grounded.'),
  Content(
      name: 'Nethaji',
      imageUrl: Assets.testimony2,
      description:
          'Wyatt then warned that “he” never forgets,\nimplying that the Fiend was coming for payback.\nIt was a good, simple setup that used the funhouse\nto tie in an issue from several years ago,\nmaking this rivalry immediately more personal\nand grounded.'),
  Content(
      name: 'Ajay',
      imageUrl: Assets.testimony3,
      description:
          'Wyatt then warned that “he” never forgets,\nimplying that the Fiend was coming for payback.\nIt was a good, simple setup that used the funhouse\nto tie in an issue from several years ago,\nmaking this rivalry immediately more personal\nand grounded.'),
];
//
final List<Content> originals = const [
  Content(
      name: 'What defines AltReKruit?',
      description:
          'Wyatt then warned that “he” never forgets,\nimplying that the Fiend was coming for payback.'),
  Content(
      name: 'As a resource person, how would I be satisfied?',
      description:
          'Wyatt then warned that “he” never forgets,\nimplying that the Fiend was coming for payback.'),
  Content(
      name: 'As a Fresher, what should I do to get a job through referral?',
      description:
          'Wyatt then warned that “he” never forgets,\nimplying that the Fiend was coming for payback.'),
  Content(
      name: 'What are the ways of getting Career advice?',
      description:
          'Wyatt then warned that “he” never forgets,\nimplying that the Fiend was coming for payback.'),
  Content(
      name: 'For how long referral would be valid',
      description:
          'Wyatt then warned that “he” never forgets,\nimplying that the Fiend was coming for payback.'),
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
