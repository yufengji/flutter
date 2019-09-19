import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 25),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 15),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xfff7f7f8),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: TextField(
                  decoration:InputDecoration(
                      hintText: "品牌、车系、车型",
                      border: InputBorder.none,
                      icon: Icon(Icons.search)
                  ),
                )
            ),
            Image.asset('assets/images/xinche.png', width: 673, height: 98,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 210,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      hintText: "请输入你的手机号",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff999999), width: 0.5 )
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff999999), width: 0.5)
                      )
                    ),
                  ),
                ),
                Container(
                  height: 41,
                  width: 105,
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.red,
                    child: Text("免费咨询", style: TextStyle(color: Colors.white),),
                    onPressed: (){

                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
