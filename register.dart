import 'package:flutter/cupertino.dart';
import 'rest.dart';
import 'kidscafe.dart';
import 'package:local_auth/local_auth.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({Key? key}) : super(key: key);

  CupertinoRegisterPageState createState() => CupertinoRegisterPageState();
}

class CupertinoRegisterPageState extends State<RegisterPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  bool _isSwitched = false;


  void register() async {}

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
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: NameController,
              placeholder: 'UserName',
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Icon(CupertinoIcons.pencil),
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
              controller: EmailController,
              placeholder: 'E-Mail',
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Icon(CupertinoIcons.envelope),
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
              controller: NameController,
              placeholder: 'Phone',
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Icon(CupertinoIcons.pencil),
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

            CupertinoTheme(
              data: CupertinoThemeData(
                primaryColor: _isSwitched ? CupertinoColors.systemBlue : CupertinoColors.systemGrey4,
              ),
              child: CupertinoButton.filled(
                onPressed: () {
                  setState(() {
                    _isSwitched = !_isSwitched;
                  });
                },
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                borderRadius: BorderRadius.circular(20),
                child: const Text('관리자'),
              ),
            ),
            CupertinoTheme(
              data: CupertinoThemeData(
                primaryColor: !_isSwitched ? CupertinoColors.systemBlue : CupertinoColors.systemGrey4,
              ),
              child: CupertinoButton.filled(
                onPressed: () {
                  setState(() {
                    _isSwitched = !_isSwitched;
                  });
                },
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                borderRadius: BorderRadius.circular(20),
                child: const Text('유저'),
              ),
            ),

            const SizedBox(height: 40),
            CupertinoButton.filled( //돌출된 느낌의 버튼 기능
              onPressed: register,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              borderRadius: BorderRadius.circular(20),
              child: const Text('Enter'),
            ),
          ],
        ),
      ),

    );
  }
}