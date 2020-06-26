import 'package:flutter/material.dart';
import 'package:wechat_demo/friends/friends_data.dart';
import 'package:wechat_demo/friends/index_bar.dart';
import 'package:wechat_demo/pages/const.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>
with AutomaticKeepAliveClientMixin<FriendsPage>{


  ScrollController _scrollController;
  final List<Friends> _listDatas = [];
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();
    _listDatas..addAll(datas)..addAll(datas);
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });
    _scrollController = ScrollController();
    //创建字母对应Offset的Map
    var _groupOffset = 54.0 * 4;
    for (int i = 0; i < _listDatas.length; i++) {
      if (i < 1) {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += 84;
      } else if (_listDatas[i].indexLetter == _listDatas[i - 1].indexLetter) {
        _groupOffset += 54;
      } else {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += 84;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    super.build(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        title: Text('通讯录'),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset('images/icon_friends_add.png', width: 25,),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DiscoverChildPage(title: '添加朋友',)
              )
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: WeChatThemeColor,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _listDatas.length + _headerData.length,
              itemBuilder: _itemForRow,
            ),
          ),
          Indexbar(
            indexBarCallBack: (String str){
              if (_groupOffsetMap[str] != null) {
                _scrollController.animateTo(
                  _groupOffsetMap[str],
                  duration: Duration(milliseconds: 10),
                  curve: Curves.easeIn,
                );
              }
            },
          ),
        ],
      ),
    );

  }

  final List<Friends> _headerData = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  Widget _itemForRow(BuildContext context, int index) {
    //显示头部4个cell
    if (index < _headerData.length) {
      return _FriendCell(
        imageAssets: _headerData[index].imageUrl,
        name: _headerData[index].name,
      );
    };
    if (index > 4 && _listDatas[index - 4].indexLetter ==
        _listDatas[index - 5].indexLetter) {
      return _FriendCell(
        imageUrl: _listDatas[index - 4].imageUrl,
        name: _listDatas[index - 4].name,
      );

    }
    return _FriendCell(
      imageUrl: _listDatas[index - 4].imageUrl,
      name: _listDatas[index - 4].name,
      groupTitle: _listDatas[index - 4].indexLetter,
    );
  }


}


class _FriendCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;

  _FriendCell({
    this.imageUrl,
    this.name,
    this.groupTitle,
    this.imageAssets,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            height: groupTitle != null ? 30 : 0,
            color: Color.fromRGBO(1, 1, 1, 0.0),
            child: groupTitle != null ? Text(
              groupTitle, style: TextStyle(color: Colors.grey),) : null,
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                      image: imageUrl != null
                          ? NetworkImage(imageUrl)
                          : AssetImage(imageAssets),
                    ),
                  ),

                ), //图片
                Container(
                  height: 54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: ScreenWidth(context) - 54,
                        height: 53.5,
                        alignment: Alignment.centerLeft,
                        child: Text(name, style: TextStyle(fontSize: 18),),
                      ),
                      Container(
                        height: 0.5,
                        color: WeChatThemeColor,
                        width: ScreenWidth(context) - 54,
                      ),
                    ],
                  ),

                ), //昵称 + 底部线条
              ],
            ),
          ),
        ],
      ),
    );
  }
}


