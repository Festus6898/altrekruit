import 'package:flutter/material.dart';
import 'package:mera_app/assets.dart';
import 'package:mera_app/models/content_model.dart';
import 'package:mera_app/widgets/responsive.dart';
import 'package:video_player/video_player.dart';

import 'vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featuredContent: featuredContent),
      desktop: _ContentHeaderDesktop(featuredContent: featuredContent),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.login2),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _PlayButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _ContentHeaderDesktop({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
//  VideoPlayerController _videoController;
//  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
//    _videoController =
//        VideoPlayerController.network(widget.featuredContent.videoUrl)
//          ..initialize().then((_) => setState(() {}))
//          ..setVolume(0)
//          ..play();
  }

  @override
  void dispose() {
    //_videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Row(
            children: [
              Container(width: 100.0),
              Expanded(
                child: LimitedBox(
                  maxHeight: 600,
                  child: PageView(
                    children: [
                      CarouselSlider(
                        carouselSlideImage: Assets.slide1,
                      ),
                      CarouselSlider(
                        carouselSlideImage: Assets.slide2,
                      ),
                      CarouselSlider(
                        carouselSlideImage: Assets.login1,
                      ),
                    ],
                  ),
                ),
              ),
              Container(width: 100.0),
            ],
          ),
          Positioned(
            left: 120.0,
            right: 120.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featuredContent.titleImageUrl),
                ),
                const SizedBox(height: 15.0),
                Text(
                  widget.featuredContent.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(width: 16.0),
                    FlatButton.icon(
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
                      onPressed: () => print('More Info'),
                      color: Colors.white,
                      icon: const Icon(Icons.person_outline, size: 30.0),
                      label: const Text(
                        'Enroll as Freshers',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: !Responsive.isDesktop(context)
          ? const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
          : const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
      onPressed: () => print('Play'),
      color: Colors.white,
      icon: const Icon(Icons.people_alt_outlined, size: 30.0),
      label: const Text(
        'Enroll as Resource Person',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class CarouselSlider extends StatelessWidget {
  final String carouselSlideImage;
  CarouselSlider({this.carouselSlideImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              carouselSlideImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
