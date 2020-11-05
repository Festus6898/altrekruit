import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mera_app/models/content_model.dart';

class FaqList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const FaqList({
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
          height: 180.0,
          child: Swiper(
//            padding: const EdgeInsets.symmetric(
//              vertical: 12.0,
//              horizontal: 18.0,
//            ),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return Card(
                color: Colors.transparent,
//                child: ListTile(
//                  title: Text(
//                    content.name,
//                    style: const TextStyle(
//                      color: Colors.white,
//                      fontSize: 24.0,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                  subtitle: Text(
//                    content.description,
//                    style: const TextStyle(
//                      color: Colors.white,
//                      fontSize: 18.0,
//                      fontWeight: FontWeight.w200,
//                    ),
//                  ),
//                  isThreeLine: true,
//                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 18.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.red, width: 2.0),
                  ),
                  child: Column(
                    children: [
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
                      Text(
                        content.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
