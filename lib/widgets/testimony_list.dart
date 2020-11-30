import 'package:flutter/material.dart';
import 'package:mera_app/models/content_model.dart';

class TestimonyList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const TestimonyList({
    Key key,
    @required this.title,
    @required this.contentList,
    this.isOriginals = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          height: 540.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 15.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 18.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => print(content.name),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 200.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(content.imageUrl),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red, width: 2.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 10.0,
                    ),
                    Center(
                      child: Text(
                        content.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                      width: 10.0,
                    ),
                    Center(
                      child: Text(
                        content.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
