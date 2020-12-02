import 'package:flutter/material.dart';
import 'package:mera_app/screens/screens.dart';
import 'package:mera_app/widgets/responsive.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color: Colors.black45,
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Text(
            "altReKruit",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          //Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'Consult',
                  onTap: () => print('Consult'),
                ),
                _AppBarButton(
                  title: 'AI Portal',
                  onTap: () => print('AI Portal'),
                ),
                _AppBarButton(
                  title: 'Referral',
                  onTap: () => print('Referral'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Text(
            "ALTRekruit".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
//          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                    title: 'Home', //TestScreen
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }),
                _AppBarButton(
                  title: 'Consult',
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => ResourceDisplayScreen()),
//                    );
                  },
                ),
                _AppBarButton(
                  title: 'AI Portal',
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => TestScreen()),
//                    );
                  },
                ),
                _AppBarButton(
                  title: 'Why US',
                  onTap: () => print('Why US'),
                ),
                _AppBarButton(
                  title: 'FAQ',
                  onTap: () => print('FAQ'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Search'),
                ),
                _AppBarButton(
                  title: 'Profile',
                  onTap: () {
                    print("My Profile");
                  },
                ),
                _AppBarButton(
                  title: 'Logout',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InitialNavigateScreen()),
                    );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Gift'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Notifications'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.transparent,
      hoverColor: Colors.deepPurple,
      onPressed: onTap,
      child: AbsorbPointer(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
