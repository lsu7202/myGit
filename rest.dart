import 'dart:convert';
import 'package:http/http.dart' as http;

///DB로부터 데이터를 Get요청합니다.
///파라미터 : json url
///return <List<dynamic>>
Future<List<dynamic>> fetchGet(String json) async {
  final url = Uri.parse(json);
  final response = await http.get(url);

  if(response.statusCode == 200){
    List<dynamic> myData = jsonDecode(response.body);
    print(myData);
    return myData;
  }
  else {
    print('데이터가져오기 실패');
    return [];
  }
}

///DB 데이터를 순회하며 ID와 PW를 비교합니다.
  ///파라미터 : List<dynamic>, ID, PW
  ///return Bool
bool SearchAuth(List<dynamic> myData, var id, String pw) {
  for (var item in myData) {
    print(item);
    if (item['id'] == id){
      if (item['password'] == pw){
        return true;
      }
      else {
        return false;
      }
    }
  }
  print("등록되지 않은 아이디.");
  return false;
}

//Post 방식 연습!
Future<void> fetchPost() async {
  Map<String, dynamic> postData = {
    "profile" : {
      "age" : 24
    }
  };

  final url = Uri.parse('https://my-json-server.typicode.com/lsu7202/typicode/posts');
  final response = await http.post(url,
      body: jsonEncode(postData));

  if (response.statusCode == 201) {
    print('데이터가 성공적으로 전송되었습니다.');
  } else {
    print('데이터 전송 실패: ${response.statusCode}');
  }
}

void main() async{
  List<dynamic> userData = await fetchGet('http://localhost:3000/users');
  print(SearchAuth(userData, 1, '1234'));
}