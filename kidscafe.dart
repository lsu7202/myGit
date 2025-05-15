import 'package:flutter/cupertino.dart';
import 'package:main/pushmsg.dart';
import 'buffer.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => mainState();
}

class mainState extends State<mainPage> {
  @override
  void initState() {
    super.initState();
    initializeNotification();
    buffer();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell_fill),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle_fill),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: const CupertinoNavigationBar(
                    middle: Text('홈'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: const Image(
                              image: AssetImage('assets/child.jpeg'),
                              width: 400,
                              height: 400,
                        )),
                        CupertinoButton.filled(
                          onPressed: (){
                            String text = "알림";
                            String msg = "넘어짐 감지. 확인해주세요.";
                            showNotification(text, msg);
                            NotificationPut(text, msg);
                            },
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                          borderRadius: BorderRadius.circular(20),
                          child: const Icon(CupertinoIcons.check_mark_circled, size: 25.0),
                        )
                        ],
                    ),
                  ),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(CupertinoIcons.bell, size: 30),
                              CupertinoSwitch(
                                value: true,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemCount: NotificationGet().length,
                              itemBuilder: (context, index) {
                              return CupertinoListTile(
                              title: Text(NotificationGet()[index]['title']),
                              subtitle: Text(NotificationGet()[index]['msg']),
                              trailing: CupertinoButton(
                                child: Icon(CupertinoIcons.xmark),
                                onPressed: () {
                                  NotificationDelete(index);
                                  setState(() {

                                  });
                                },
                              ),
                              );
                              },
                            ),
                          )

                        ]
                    ),
                  ),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: const CupertinoNavigationBar(
                    middle: Text('내정보'),
                  ),
                  child: Center(
                    child: Column(
                      children: const [
                        Text('내정보 화면'),
                      ],
                    ),
                  ),
                );
              },
            );
          default:
            return const Center(child: Text('없음'));
        }
      },
    );
  }
}