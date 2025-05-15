import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart'; // 로그인 화면 임포트
import 'kidscafe.dart'; // 메인 화면 임포트

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // 생성자 키를 지정해 위젯을 재사용 할 수 있게함

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: '키즈카페 앱',
      home: const LoginPage(), // 시작 화면을 로그인 화면으로 설정
      routes: {
        '/kidscafe': (context) => const mainPage(), // 메인 화면 라우트 추가
      },
    );
  }
}