import 'package:flutter/material.dart';
import 'package:mera_app/models/rp_model.dart';

class ConsultantPreview extends StatelessWidget {
  final String title;
  final List<ResourcePerson> contentList;

  const ConsultantPreview({
    Key key,
    @required this.title,
    @required this.contentList,
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
          height: 360.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 15.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final ResourcePerson content = contentList[index];
              return Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => print(content.name),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            height: 200.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(content.imageUrl),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: content.color, width: 2.0),
                            ),
                          ),
                          Container(
                            height: 200.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.black87,
                                  Colors.black45,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.25, 1],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: content.color, width: 2.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      content.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      content.designation,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
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
