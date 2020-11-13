import 'package:flutter/material.dart';
import 'package:mera_app/datatemp/data.dart';
import 'package:mera_app/widgets/widgets.dart';

class InitialHomeScreen extends StatefulWidget {
  @override
  _InitialHomeScreenState createState() => _InitialHomeScreenState();
}

class _InitialHomeScreenState extends State<InitialHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[850],
          child: const Icon(Icons.cast),
          onPressed: () => print('Cast'),
        ),
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: InitialCustomAppBar(),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ContentHeader(featuredContent: splashContent),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 20.0),
              sliver: SliverToBoxAdapter(
                child: ConsultantPreview(
                  title: 'Top Consultants',
                  contentList: previews,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TestimonyList(
                title: 'Testimonial Reviews',
                contentList: myList,
              ),
            ),
            SliverToBoxAdapter(
              child: FaqList(
                title: 'Frequently Asked Questions',
                contentList: originals,
              ),
            ),
            SliverToBoxAdapter(
              child: ContactsWidget(
                title: 'Get In Touch',
              ),
            ),
          ],
        ));
  }
}
