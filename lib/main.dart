import 'package:flutter/material.dart';
import 'package:hello_world/down.dart';
import 'package:hello_world/gravity.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:hello_world/secondPage.dart';

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
      routes: {
        'secondPage': (BuildContext context) => SecondPage(),
        "down": (_) => Down(),
        "gravity": (_) => PhysicsAnimation(),
      },
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
    // Fluttertoast.showToast(
    //     msg: "功能开发中",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIos: 1,
    //     backgroundColor: Colors.black,
    //     textColor: Colors.white);
  }
  void gotoSecondPage(String e) {
    Navigator.pushNamed(context, "secondPage", arguments: {});
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return SecondPage(e);
    // }));
  }

  void goDown(String e) {
    Navigator.pushNamed(context, "down", arguments: {});
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return SecondPage(e);
    // }));
  }

  void goGravity() {
    Navigator.pushNamed(context, "gravity", arguments: {});
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return SecondPage(e);
    // }));
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
            onPressed: () {
              goDown("");
            },
          ),
          TextButton(
            child: const Text(
              '图书',
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
            onPressed: () => gotoSecondPage("111"),
          ),
          TextButton(
            child: const Text(
              '音乐',
              style: TextStyle(
                color: Colors.yellowAccent,
              ),
            ),
            onPressed: () {
              goGravity();
            },
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
                              child: Text("更多",
                                  style: TextStyle(color: Colors.green)),
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
                                          onTap: () => gotoSecondPage(
                                              item['url'].toString().trim()),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            height: 180.0,
                                            width: 120.0,
                                            child: Image.network(
                                                item['url'].toString().trim()),
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
// class SecondPage extends StatelessWidget {
//   var url;
//   SecondPage(String url) {
//     // print(url);
//     this.url = url;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('查看图片'),
//       ),
//       body: Container(
//         color: Colors.black,
//         child: Center(
//             child: PhotoView(
//           imageProvider: NetworkImage(this.url),
//         )),
//       ),
//     );
//   }
// }
