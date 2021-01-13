import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '豆瓣'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var netWorkUrl = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.initArrUrl(9);
  }

  void _incrementCounter() {
    this.initArrUrl(9);
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "功能开发中",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  Future<void> _askedToLead() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
                margin: EdgeInsets.only(left: 30, right: 30),
                // color: Colors.red,
                height: 450,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "请按照以下要求拍摄证件照片",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 16, decoration: TextDecoration.none),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 42),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                color: Colors.orange,
                                width: 120,
                                height: 80,
                                child: Image.network(
                                    "https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3957023499,1417165162&fm=58&s=D7E4BD44804FBB4F2C7C1410030010C8"),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "标准",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13,
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Container(
                                color: Colors.orange,
                                width: 120,
                                height: 80,
                                child: Image.network(
                                    "https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3957023499,1417165162&fm=58&s=D7E4BD44804FBB4F2C7C1410030010C8"),
                              ),
                              Text(
                                "标准",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25.5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                color: Colors.orange,
                                width: 120,
                                height: 80,
                                child: Image.network(
                                    "https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3957023499,1417165162&fm=58&s=D7E4BD44804FBB4F2C7C1410030010C8"),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "标准",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13,
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Container(
                                color: Colors.orange,
                                width: 120,
                                height: 80,
                                child: Image.network(
                                    "https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3957023499,1417165162&fm=58&s=D7E4BD44804FBB4F2C7C1410030010C8"),
                              ),
                              Text(
                                "标准",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(115))),
                      margin: EdgeInsets.only(top: 43.5),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        padding: EdgeInsets.only(left: 111.5, right: 111.5, bottom: 12, top: 12),
                        color: Color.fromRGBO(0, 107, 225, 1),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "好的",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                )),
          );
        });
  }

  void gotoSecondPage(String e) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return SecondPage(e);
    }));
  }

  void initArrUrl(int count) {
    print(count);
    count = count == null || count > 10 ? 10 : count;
    var arr = [];
    for (int i = 0; i < count; i++) {
      print(i);
      arr.add({
        "url":
            "https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3957023499,1417165162&fm=58&s=D7E4BD44804FBB4F2C7C1410030010C8",
        "index": i
      });
    }

    setState(() {
      netWorkUrl = arr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          TextButton(
            child: const Text(
              '电影',
              style: TextStyle(
                color: Colors.lightGreenAccent,
              ),
            ),
            onPressed: _askedToLead,
          ),
          TextButton(
            child: const Text(
              '图书',
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
            onPressed: showToast,
          ),
          TextButton(
            child: const Text(
              '音乐',
              style: TextStyle(
                color: Colors.yellowAccent,
              ),
            ),
            onPressed: showToast,
          ),
          TextButton(
            child: const Text(
              '小组',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: showToast,
          ),
          IconButton(
            color: Colors.green,
            icon: Icon(Icons.search),
            tooltip: 'Repair it',
            onPressed: showToast,
          ),
        ],
      ),
      body: Container(
        child: new Container(
            child: ListView(
          children: [
            Container(
                height: 280,
                //  color: Colors.blue,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: new Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                            child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  '影院热映',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            TextButton(
                              child: Text("更多", style: TextStyle(color: Colors.green)),
                              onPressed: _incrementCounter,
                            ),
                          ],
                        ))),
                    Expanded(
                        flex: 4,
                        child: Container(
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: netWorkUrl.map((item) {
                                print(item['url'].toString().trim());
                                return Container(
                                  height: 300,
                                  child: Column(
                                    children: [
                                      InkWell(
                                          onTap: () => gotoSecondPage(item['url'].toString().trim()),
                                          child: Container(
                                            margin: const EdgeInsets.only(right: 10),
                                            height: 180.0,
                                            width: 120.0,
                                            child: Image.network(item['url'].toString().trim()),
                                          )),
                                      Container(
                                        height: 30,
                                        width: 120,
                                        child: Center(
                                            child: Text(
                                          "环太平洋${item["index"]}",
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                      )
                                    ],
                                  ),
                                );
                              }).toList()),
                        ))
                  ],
                )),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add_alarm),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  var url;
  SecondPage(String url) {
    // print(url);
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查看图片'),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
            child: PhotoView(
          imageProvider: NetworkImage(this.url),
        )),
      ),
    );
  }
}
