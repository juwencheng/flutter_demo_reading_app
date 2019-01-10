import 'package:flutter/material.dart';
import 'package:reading_app/home_page.dart';

class DetailPage extends StatefulWidget {
  final Book book;
  DetailPage({this.book});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF0b0d10),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            _HeaderView(
              book: widget.book,
            ),
            SizedBox(height: 16),
            Divider(
              height: 1,
            ),
            // 三个操作按钮
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _ActionButton(
                      color: Color(0xFF7B8EA2),
                      title: "Like",
                      iconData: Icons.thumb_up),
                  _ActionButton(
                      color: Color(0xFF7B8EA2),
                      title: "Share",
                      iconData: Icons.share),
                  _ActionButton(
                      color: Color(0xFF7B8EA2),
                      title: "Bookself",
                      iconData: Icons.collections_bookmark),
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Wow, wow, wow this totally blew me away and yes I am stealing Endless's words from her. I am gobsmacked at how brilliant the story of Muffin is, he's a complete brat, willful and stubborn as hell but underneath all those prickles is a vulnerable little kid starving for affection, I loved him. Vincenzo and Alrick are great secondary characters who provide quite a bit of entertainment and Asher is well um a devious, bad man. Another online fic that is better than a lot of published m/m",
                    style: TextStyle(height: 1.2),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Check the directory",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: _BottomToolbar(),
    );
  }
}

class _BottomToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "\$49.00",
                    style: TextStyle(
                      color: Color(0xFF244364),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "\$65.00",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      decoration:
                          TextDecoration.combine([TextDecoration.lineThrough]),
                    ),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RaisedButton(
              color: Color(0xFF244364),
              onPressed: () {},
              child: Text(
                "Buy",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderView extends StatelessWidget {
  final Book book;
  _HeaderView({this.book});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(book.cover), fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      book.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times",
                        color: Color(0xFF0b0d10),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Author: ${book.author}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF0b0d10),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "${book.description}",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.star,
                                  size: 18, color: Color(0xFFFED43B)),
                              SizedBox(width: 4.0),
                              Icon(Icons.star,
                                  size: 18, color: Color(0xFFFED43B)),
                              SizedBox(width: 4.0),
                              Icon(Icons.star,
                                  size: 18, color: Color(0xFFFED43B)),
                              SizedBox(width: 4.0),
                              Icon(Icons.star,
                                  size: 18, color: Color(0xFFFED43B)),
                              SizedBox(width: 4.0),
                              Icon(Icons.star,
                                  size: 18, color: Color(0xFFFED43B)),
                            ],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "5.0",
                            style: TextStyle(
                                color: Color(0xFFFED43B), fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Color color;
  final String title;
  final IconData iconData;
  _ActionButton({this.color, this.title, this.iconData});
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: () {},
      icon: Icon(
        iconData,
        color: color,
      ),
      label: Text(title, style: TextStyle(color: color)),
    );
  }
}
