import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wechat_demo/chat/chat.dart';
import 'package:wechat_demo/chat/search_bar.dart';
import 'package:wechat_demo/pages/const.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

PopupMenuItem<String> _buildItem(String imgAss, String title) {
  return PopupMenuItem(
    child: Row(
      children: [
        Image.asset(
          imgAss,
          width: 20,
        ),
        Container(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

//回调方法
List<PopupMenuItem<String>> _buildPopupMunuItem(BuildContext context) {
  return <PopupMenuItem<String>>[
    _buildItem('images/发起群聊.png', '发起群聊'),
    _buildItem('images/添加朋友.png', '添加朋友'),
    _buildItem('images/扫一扫1.png', '扫一扫'),
    _buildItem('images/收付款.png', '收付款'),
  ];
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin<ChatPage> {

  @override
  bool get wantKeepAlive => true;

  List<Chat> _datas = [];

  bool _cancelConnect = false;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDatas().then((List<Chat> datas){
      if(!_cancelConnect){
        setState(() {
          _datas = datas;
        });
      }
    }).catchError((e){
      print(e);
    }).whenComplete((){
      print('完毕');
    }).timeout(Duration(seconds: 6)).catchError((timeout){
      _cancelConnect = true;
      print('超时:${timeout}');
    });
    
  }

  Future<List<Chat>> getDatas() async {
    _cancelConnect = false;
    final response = await http
        .get('http://rap2api.taobao.org/app/mock/224518/api/chat/list');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      //转换模型数组
      List<Chat> chatList = responseBody['chat_list']
          .map<Chat>((item) => Chat.fromJson(item))
          .toList();
      return chatList;
    }else{
      throw Exception('statusCode:${response.statusCode}');
    }
  }


  Widget _buildItemForRow(BuildContext context, int index) {

    if(index == 0){
      return SearchCell(datas: _datas,);
    }

    return ListTile(
      title: Text(_datas[index].name),
      subtitle: Container(
        height: 20,
        width: 20,
        child: Text(
          _datas[index].message,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_datas[index].imageUrl),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        centerTitle: true,
        title: Text('微信'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              offset: Offset(0, 60.0),
              child: Image(
                image: AssetImage('images/圆加.png'),
                width: 25,
              ),
              itemBuilder: _buildPopupMunuItem,
            ),
          )
        ],
      ),
      body: Container(
          child: _datas.length == 0
              ? Center(
            child: Text('Loading..'),
          )
              : ListView.builder(
            itemCount: _datas.length,
            itemBuilder: _buildItemForRow,
          )),
    );
  }
}
