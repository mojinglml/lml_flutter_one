import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';


class DiscoverCell extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final String subImageName;

  const DiscoverCell({
    Key key,
    @required this.title,
    @required this.subTitle,
    this.imageName,
    this.subImageName,
  })  : assert(title != null, 'title 不能为空'),
        assert(imageName != null,'iamgeName 不能为空');

  @override
  State<StatefulWidget> createState() {
    return _DiscoverCellState();
  }
}


class _DiscoverCellState extends State<DiscoverCell>{


  @override
  Widget build(BuildContext context) {

    Color _currentColor = Colors.white;

    // TODO: implement build
    return GestureDetector(
      onTap: (){

        Navigator.of(context).push(MaterialPageRoute(
          builder:(BuildContext context) => DiscoverChildPage(
            title: widget.title,
          )
        ));
        setState(() {
          _currentColor = Colors.white;
        });
      },

      onTapDown: (TapDownDetails details){
        setState(() {
          _currentColor = Colors.grey;
        });
      },

      onTapCancel: (){
        setState(() {
          _currentColor = Colors.white;
        });
      },

      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
//            color: Colors.red,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    widget.imageName,
                    width: 20,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(widget.title),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(widget.subTitle != null ? widget.subTitle : ''),
                  widget.subImageName != null ? Image.asset(widget.subImageName,width: 15,) : Container(),
                  Image.asset(
                    'images/icon_right.png',
                    width: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}