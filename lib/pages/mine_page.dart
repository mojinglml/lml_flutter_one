import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/const.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  Widget headerWidget(){
    return Container(
      height: 200,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(image: AssetImage('images/mine_header.jpeg')),
                ),
              ),//头像
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        child: Text('Light',style: TextStyle(fontSize: 25),),
                      ),//微信昵称
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('微信号：123456',style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey
                            ),),
                            Image.asset('images/icon_right.png',width: 15,),
                          ],
                        ),
                      ),//账号
                    ],
                  ),
                ),
              ),
            ],

          ),
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(220, 220, 220, 1),
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      headerWidget(),
                      SizedBox(height: 10,),
                      DiscoverCell(imageName: 'images/微信支付1.png',title: '支付',),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(
                        imageName: 'images/微信收藏.png',
                        title: '收藏',
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 50, height: 0.5, color: Colors.white),
                          Container(height: 0.5, color: Colors.grey)
                        ],
                      ), //分割线
                      DiscoverCell(
                        imageName: 'images/微信相册.png',
                        title: '相册',
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 50, height: 0.5, color: Colors.white),
                          Container(height: 0.5, color: Colors.grey)
                        ],
                      ), //分割线
                      DiscoverCell(
                        imageName: 'images/微信卡包.png',
                        title: '卡包',
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 50, height: 0.5, color: Colors.white),
                          Container(height: 0.5, color: Colors.grey)
                        ],
                      ), //分割线
                      DiscoverCell(
                        imageName: 'images/微信表情.png',
                        title: '表情',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(
                        imageName: 'images/微信设置.png',
                        title: '设置',
                      ),

                    ],
              )),
            ),//列表
            Container(
              margin: EdgeInsets.only(top: 40,right: 10),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('images/相机.png'),
                ],
              ),
            ),//相机
          ],
        ),
      ),
    );
  }
}

