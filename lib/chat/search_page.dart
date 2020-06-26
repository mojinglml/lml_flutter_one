import 'package:flutter/material.dart';
import 'package:wechat_demo/chat/chat.dart';
import 'package:wechat_demo/chat/search_bar.dart';

class SearchPage extends StatefulWidget {
  final List<Chat> datas;

  const SearchPage({Key key, this.datas}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Chat> _models = []; //内容显示根据模型数组来
  String _searchStr = '';

  void _searchData(String text) {
    if (text.length == 0) {
      _models = [];
    } else {
      _models.clear();
      for (int i = 0; i < widget.datas.length; i++) {
        if (widget.datas[i].name.contains(text)) {
          _models.add(widget.datas[i]);
        }
      }
    }
    _searchStr = text;


    setState(() {});
  }

  //高亮显示
  Widget _title(String name) {
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black);
    TextStyle highlStyle = TextStyle(fontSize: 16, color: Colors.green);

    List<TextSpan> spans = [];
    //找到哪些是高亮的哪些是黑色的
    List<String> strs = name.split(_searchStr);
    for (int i = 0; i < strs.length; i++) {
      String str = strs[i];
      if (str == '' && i < strs.length - 1) {
        spans.add(TextSpan(text: _searchStr, style: highlStyle));
      } else {
        spans.add(TextSpan(text: str, style: normalStyle));
        if (i < strs.length - 1) {
          spans.add(TextSpan(text: _searchStr, style: highlStyle));
        }
      }
    }
    return RichText(
      text: TextSpan(children: spans),
    );
  }

  Widget _itemForRow(BuildContext context, int index) {
    return ListTile(
      title: _title(_models[index].name), //
      subtitle: Container(
        height: 20,
        width: 20,
        child: Text(
          _models[index].message,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_models[index].imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(
            onChanged: (String str) {
              _searchData(str);
            },
          ),
          Expanded(
            flex: 1,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (ScrollNotification note) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: ListView.builder(
                  itemCount: _models.length,
                  itemBuilder: _itemForRow,
                  ))
              ),
            )
        ],
      ),
    );
  }
}
