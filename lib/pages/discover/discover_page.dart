import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  
  Color _themeColor = Color.fromRGBO(220, 220, 220, 1.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeColor,
        centerTitle: true,
        title: Text('发现'),
        elevation: 0.0,
      ),
      body: Container(
        color: _themeColor,
        height: 800,
        child: ListView(
          children: <Widget>[
            DiscoverCell(
              title: '朋友圈',
              subTitle: '',
              imageName: 'images/朋友圈.png',
            ),
            SizedBox(height: 10,),
            DiscoverCell(
              title: '扫一扫',
              subTitle: '',
              imageName: 'images/扫一扫2.png',
            ),
            Row(
              children: <Widget>[
                Container(color: Colors.white,height: 0.5,width: 40,),
                Container(color: Colors.grey,height: 0.5,),
              ],
            ),
            DiscoverCell(
              title: '摇一摇',
              subTitle: '',
              imageName: 'images/摇一摇.png',
            ),
            SizedBox(height: 10,),
            DiscoverCell(
              title: '看一看',
              subTitle: '',
              imageName: 'images/看一看icon.png',
            ),
            Row(
              children: <Widget>[
                Container(color: Colors.white,height: 0.5,width: 40,),
                Container(color: Colors.grey,height: 0.5,),
              ],
            ),
            DiscoverCell(
              title: '搜一搜',
              subTitle: '',
              imageName: 'images/搜一搜 2.png',
            ),
            SizedBox(height: 10,),
            DiscoverCell(
              title: '附近的人',
              subTitle: '',
              imageName: 'images/附近的人icon.png',
            ),
            SizedBox(height: 10,),
            DiscoverCell(
              title: '购物',
              subTitle: '618限时特价',
              imageName: 'images/购物.png',
              subImageName: "images/badge.png",
            ),
            Row(
              children: <Widget>[
                Container(color: Colors.white,height: 0.5,width: 40,),
                Container(color: Colors.grey,height: 0.5,),
              ],
            ),
            DiscoverCell(
              title: '游戏',
              subTitle: '',
              imageName: 'images/游戏.png',
            ),
            SizedBox(height: 10,),
            DiscoverCell(
              title: '小程序',
              subTitle: '',
              imageName: 'images/小程序.png',
            ),


          ],
        )
      ),
    );
  }
}





