import 'package:flutter/material.dart';
import 'package:reading_app/detail_page.dart';
import 'package:reading_app/home_search_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode _focus = new FocusNode();
  final Color fontColor = Color(0xFF0b0d10);

  final recommendList = <Book>[
    Book(
      title: "Heart in Hand",
      author: "Salifiable",
      description:
          "Darryl had realized very early on that for better or worse, he would be linked to Aleksey Kuznetsov for the rest of his life. But he never expected anything like this.",
      cover: "https://images.gr-assets.com/books/1364753584l/13151360.jpg",
      rating: 3.94,
    ),
    Book(
      title: "Drunk Text",
      author: "Seventhswan",
      description:
          "Gunnar wakes up in his dorm room on a Friday in April and notices three things in rapid succession. The most pressing is a text message that says: \"God, my ass hurts. I can't even sit down properly. Cheers to you. Coffee @ 1?\"",
      cover: "https://images.gr-assets.com/books/1395690840l/13494082.jpg",
      rating: 4.0,
    ),
  ];
  final newbookList = <Book>[
    Book(
      title: "Control",
      author: "Cordelia Kingsbridge, third line",
      description:
          "When Control agent Joaquin Castillo finds himself unintentionally bound to a brainwashed sex slave, he vows to restore the boy's memories and set him free. Then he discovers the boy's true identity, and everything goes straight to hell.",
      cover: "https://images.gr-assets.com/books/1430855525l/18488996.jpg",
      rating: 4.09, // https://www.goodreads.com/book/show/18488996-control
    ),
    Book(
      title: "No Homo",
      author: "RemainNameless",
      description:
          "3 FourLokos + 1 peer-pressuring cat - 1 best bro to end all best bros = 1 Craigslist ad headline that reads \"str8 dude - m4m - strictly platonic\".",
      cover: "https://images.gr-assets.com/books/1401890281l/21570001.jpg",
      rating: 4.06, //https://www.goodreads.com/book/show/18488996-control
    ),
    Book(
      title: "Muffin",
      author: "Mahsa",
      description:
          "He was just a homeless kid wandering the streets, never expecting his life to change, for the worse or the better.",
      cover: "https://images.gr-assets.com/books/1409781343l/11225586.jpg",
      rating: 4.06, //https://www.goodreads.com/book/show/18488996-control
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focus.addListener(() async {
      if (_focus.hasFocus) {
        _focus.unfocus();
        var result =
            await showSearch(context: context, delegate: HomeSearchDelegate());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.collections_bookmark),
          color: fontColor,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_align_left),
            color: Color(0xff0b0d10),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8.0, right: 16.0),
        child: ListView(children: <Widget>[
          Text(
            "Today",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: fontColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFAFAFA),
                    offset: Offset(6, 6),
                    blurRadius: 6,
                  ),
                  BoxShadow(
                    color: Color(0xFFFAFAFA),
                    offset: Offset(-6, -6),
                    blurRadius: 6,
                  ),
                ]),
//            elevation: 10,
//            shadowColor: Color(0xffFAFAFA),
            child: TextField(
              focusNode: _focus,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search...",
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          _HeadingView(
            title: "Recommend",
            onTap: () {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: recommendList.map((book) {
              return _RecommendListItem(
                book: book,
                width: (MediaQuery.of(context).size.width - 32) * 0.8,
                height: 140,
                shadowOffset: Offset(6, 6),
              );
            }).toList()),
          ),
          SizedBox(
            height: 16.0,
          ),
          _HeadingView(
            title: "New book hot list",
            onTap: () {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
//            shrinkWrap: true,
//            scrollDirection: Axis.horizontal,
              children: newbookList.map((book) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                  ),
                  child: _HostListItem(
                    book: book,
                  ),
                );
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}

class _HeadingView extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  _HeadingView({this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    final Color fontColor = Color(0xFF0b0d10);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              softWrap: true,
              style: TextStyle(
                fontSize: 20,
                color: fontColor,
                fontFamily: "Times",
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          RawMaterialButton(
            child: Row(
              children: <Widget>[
                Text(
                  "view all",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey,
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Book {
  String cover;
  String title;
  String author;
  String description;
  double rating;
  Book({this.cover, this.title, this.author, this.description, this.rating});
}

class _RecommendListItem extends StatelessWidget {
  final Offset shadowOffset;
  final double width;
  final double height;
  final Book book;
  _RecommendListItem({this.shadowOffset, this.width, this.height, this.book});
  @override
  Widget build(BuildContext context) {
    double offsetY = 10;
    double internalHeight = height - shadowOffset.dy * 2.0 - offsetY;
    double internalWidth = width - shadowOffset.dx * 2;

    double margin = 16;
    double coverLeft = shadowOffset.dx * 2 + margin;
    double coverWidth = internalWidth * 0.3;

    double contentLeft = coverLeft + margin + coverWidth;

    return Container(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                book: book,
              );
            },
          ));
        },
        child: Stack(
//        fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: offsetY + shadowOffset.dy,
              left: shadowOffset.dx,
              child: Container(
                height: internalHeight,
                width: internalWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFAFAFA),
                      offset: shadowOffset,
                      blurRadius: shadowOffset.dy,
                    ),
                    BoxShadow(
                      color: Color(0xFFFAFAFA),
                      offset: -shadowOffset,
                      blurRadius: shadowOffset.dy,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: coverLeft,
              top: 0,
              child: Container(
                width: coverWidth,
                height: internalHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  image: DecorationImage(
                    image: NetworkImage(book.cover),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: shadowOffset,
                      blurRadius: shadowOffset.dy,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: contentLeft,
              top: offsetY + shadowOffset.dy,
              width: internalWidth - contentLeft,
              height: internalHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 6.0),
                  Divider(
                    height: 1.0,
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    "${book.description}",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HostListItem extends StatelessWidget {
  final Book book;
  _HostListItem({this.book});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DetailPage(
              book: book,
            );
          },
        ));
      },
      child: Container(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3, 3),
                    blurRadius: 3,
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(book.cover),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "${book.title}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
              ),
              softWrap: true,
              maxLines: 2,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "${book.author}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _UselessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double recommendBlockWidth = 300;
    return Container(
      width: recommendBlockWidth,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 4,
            top: 20,
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(4),
              child: Container(
                width: recommendBlockWidth - 8,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 16.0),
              Container(
                width: 80,
                color: Colors.redAccent,
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Sortir a Cannes"),
                    Text("Author: Michael, Jost"),
                    Divider(
                      height: 1.0,
                    ),
                    Text(
                      "After Tomas, Kruger and Bellucci",
                      softWrap: true,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
