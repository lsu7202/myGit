import 'package:flutter/cupertino.dart';
import 'rest.dart';
import 'kidscafe.dart';
import 'register.dart';
import 'FindID.dart';
import 'package:local_auth/local_auth.dart';


class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  CupertinoLoginPageState createState() => CupertinoLoginPageState();
}

class CupertinoLoginPageState extends State<LoginPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  void login() async {
    String id = idController.text;
    String pw = pwController.text;

    // id와 pw를 데이터베이스에서 조회
    List<dynamic> userData = await fetchGet('http://localhost:3000/users'); //유저데이터 요청
    bool isAuthenticated = SearchAuth(userData, id, pw); //유저데이터 검증

    if (isAuthenticated) {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => const mainPage())
      );
    }
    else {
      print("로그인 실패");
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('비밀번호 에러'),
            actions: <Widget>[
              CupertinoDialogAction(
                  child: const Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pop();
              },
              ),
            ],
          ),
      );
    }
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(''),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //const SizedBox(height: 100),
            const Image(
              image: AssetImage('assets/mainimg.png'),
            ),
            //const Text("", style: TextStyle(fontSize: 30)),
            //const SizedBox(height: 10),
            CupertinoTextField(
              controller: idController,
              placeholder: 'ID',
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Icon(CupertinoIcons.person),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                border: Border.all(color: CupertinoColors.systemGrey4),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.4),
                    offset: Offset(0, 0),     // 수직 그림자 위치
                    blurRadius: 8,            // 그림자 번짐 정도
                    spreadRadius: 2,          // 그림자 퍼짐 정도
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: pwController,
              placeholder: 'PW',
              obscureText: true,
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Icon(CupertinoIcons.lock),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                border: Border.all(color: CupertinoColors.systemGrey4),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.4),
                    offset: Offset(0, 0),     // 수직 그림자 위치
                    blurRadius: 8,            // 그림자 번짐 정도
                    spreadRadius: 2,          // 그림자 퍼짐 정도
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            CupertinoButton.filled( //돌출된 느낌의 버튼 기능
              onPressed: login,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              borderRadius: BorderRadius.circular(20),
              child: const Icon(CupertinoIcons.rocket, size: 25.0),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CupertinoButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => const RegisterPage())
                      );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    borderRadius: BorderRadius.circular(20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(CupertinoIcons.person_add, size: 30.0),
                        const Text('  회원가입'),
                      ],
                    )
                ),
                CupertinoButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => const FindidPage())
                    );
                  },
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  borderRadius: BorderRadius.circular(15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(CupertinoIcons.search, size: 30.0),
                      const Text('  ID 찾기 '),
                    ],
                  )
                ),
              ]
            )


          ],
        ),
      ),

    );
  }
}