import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const BASE_URL = 'https://h5.maimaiche.com/';

class CommonRequest{
  final Map<String, dynamic> param;
  String url;
  String method;

  CommonRequest({this.param, this.url, this.method = 'post'});
  Future fetch() async {
    var response;
    if(this.method == 'post'){
      response = await http.post(
        BASE_URL+this.url,
        headers: {"content-type" : "application/json"},
        body: json.encode(this.param)
      );
    } else if(this.method == 'get'){
      String request_url = BASE_URL+this.url;
      if(this.param != null){
        print(this.param);
        request_url += '?data='+json.encode(this.param);
      }
      response = await http.get(
          request_url
      );
    }
    if(response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return result;
    }else{
      throw Exception('加载失败');
    }
  }
}