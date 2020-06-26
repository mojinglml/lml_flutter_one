import 'package:flutter/material.dart';
import 'package:wechat_demo/chat/chat_page.dart';
import 'package:wechat_demo/pages/discover/discover_page.dart';
import 'package:wechat_demo/friends/friends_page.dart';
import 'package:wechat_demo/pages/mine_page.dart';


class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  final PageController _controller = PageController(
    initialPage: 0
  );

  List<Widget> pages = [ChatPage(), FriendsPage(), DiscoverPage(), MinePage()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _currentIndex = index;
            setState(() {
              _controller.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: _currentIndex,
          selectedFontSize: 12.0,
          items: [
            BottomNavigationBarItem(
              title: Text('微信'),
              icon: Image.asset(
                'images/tabbar_chat.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_chat_hl.png',
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('通讯录'),
              icon: Image.asset(
                'images/tabbar_friends.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_friends_hl.png',
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('发现'),
              icon: Image.asset(
                'images/tabbar_discover.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_discover_hl.png',
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('我的'),
              icon: Image.asset(
                'images/tabbar_mine.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_mine_hl.png',
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
        body: PageView(
          onPageChanged: (int index){
            _currentIndex = index;
            setState(() {

            });
          },
          controller: _controller,
          children: pages,
        ),

      ),
    );
  }
}
