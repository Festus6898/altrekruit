import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mera_app/models/content_model.dart';
import 'responsive.dart';

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
    return Responsive(
      mobile: _FaqListMobile(contentTitle: title, listContent: contentList),
      desktop: _FaqListDesktop(contentTitle: title, listContent: contentList),
    );
  }
}

class _FaqListMobile extends StatelessWidget {
  final String contentTitle;
  final List<Content> listContent;

  const _FaqListMobile({
    Key key,
    @required this.contentTitle,
    @required this.listContent,
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
              contentTitle,
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
            scrollDirection: Axis.horizontal,
            itemCount: listContent.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = listContent[index];
              return Card(
                color: Colors.transparent,
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
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}

class _FaqListDesktop extends StatelessWidget {
  final String contentTitle;
  final List<Content> listContent;

  const _FaqListDesktop({
    Key key,
    @required this.contentTitle,
    @required this.listContent,
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
              contentTitle,
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
        Row(
          children: [
            Container(
              width: 100.0,
            ),
            Expanded(
              child: Container(
                height: 180.0,
                child: Swiper(
                  scrollDirection: Axis.horizontal,
                  itemCount: listContent.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Content content = listContent[index];
                    return Card(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 18.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(color: Colors.teal[600], width: 5.0),
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
            ),
            Container(width: 100.0),
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
