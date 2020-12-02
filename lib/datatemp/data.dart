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
  'VR/AR Developer',
  'tax',
  'audit',
  'accounting',
  'risk & compliance',
  'magagement consulting',
  'financal advisory'
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
    designation: 'Digital Marketing Head',
  ),
  ResourcePerson(
    name: 'Manimozhi',
    imageUrl: Assets.user2,
    color: Colors.red,
    designation: 'Technical Developer',
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
    designation: 'Finance Manager',
  ),
  ResourcePerson(
    name: 'Ragul',
    imageUrl: Assets.user5,
    color: Colors.green,
    designation: 'Web Designer',
  ),
];

final List<Content> myList = const [
  Content(
      name: 'Chakravarthi',
      imageUrl: Assets.testimony1,
      description:
          'In the age of ed-tech there are many courses\nor options to choose from but without\nguidance of a person you get lost in learning.\nAltrekruit bridges the gap between learning\nand getting placed.'),
  Content(
      name: 'Nethaji',
      imageUrl: Assets.testimony2,
      description:
          'I was clueless regarding my career path,\naltrekruit helped me tofigure out my\ndomain according to my interest.'),
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
          'Altrekruit is a platform which connects students and job seekers with industry persons so that Students and job seekers understand the inner workings of a particular domain or get placed in top notch companies.'),
  Content(
      name: 'What is the role of industry professionals?',
      description:
          'Industry professionals help students/job seekers to reach maximum potential in the domain or industry they are working on.'),
  Content(
      name: 'How does industry professionals help students/job seekers?',
      description:
          'We provide 3 services: Carrier Advice, Mentorship and Referral.'),
  Content(
      name: 'How does the Carrier Advice work?',
      description:
          'Students/job seekers connect with industry professionals of their choice in any industry/domain. User can ask any questions from how to prepare for an interview or are they right fit for the domain to prospects in future.'),
  Content(
      name: 'How does the Referral work?',
      description:
          'Industry person evaluates a student/job seeker profile and conducts a 30-45 minute interview about his or her domain expertise. If he is satisfied with his or her  performance you get a fast tracked interview with the company he is working for.'),
  Content(
      name: 'How does the Mentorship work?',
      description:
          'This is a tailor made package for students/job seekers where they interact with industry professionals for 5 months over the course of weekend to make sure students/job seekers  can crack interviews in the domain/industry.'),
  Content(
      name: 'How much do i get paid for these services?',
      description:
          'We take flat 30 percent commission on the payment student makes.'),
  Content(
      name: 'What is the pricing for each service?',
      description:
          'For CA/Referral, we charge 1500/1000rs depending on the company/position Resource Person is holding.'),
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
