import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_twitter/model/account.dart';
import 'package:flutter_app_twitter/model/post.dart';
import 'package:flutter_app_twitter/vew/time_line/post_page.dart';
import 'package:intl/intl.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  Account myAccount = Account(
    id: '1',
    name: 'Mieet',
    selfIntroduction: 'こんにちは!Mieet登録してね!',
    userId: 'mieet_official',
    imagePath: 'https://pbs.twimg.com/profile_images/1444908349150011393/i5xLaSGd_400x400.jpg',
    createTime: Timestamp.now(),
    updateTime: Timestamp.now(),


  );

List<Post> postlist = [
  Post(
    id: '1',
    content:'初めまして',
    postAccountId:'1',
    createTime: DateTime.now(),  
    ),
    Post(
    id: '2',
    content:'初めまして2回',
    postAccountId:'1',
    createTime: DateTime.now(),  
    ),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('タイムライン',style: TextStyle(color: Colors.black),),
        backgroundColor: Theme.of(context).canvasColor,//色をbodyと同じ色に
        elevation: 2,//影の濃さ
      ),
      body: ListView.builder(
        itemCount: postlist.length,//postlistの数
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: index == 0? Border(
                top: BorderSide(color: Colors.grey,width: 0),
                bottom: BorderSide(color: Colors.grey,width: 0),
              ) :Border(bottom: BorderSide(color: Colors.grey,width: 0),),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  foregroundImage: NetworkImage(myAccount.imagePath),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(myAccount.name,style: TextStyle(fontWeight:  FontWeight.bold),),
                                Text('@${myAccount.userId}',style: TextStyle(color: Colors.green)),
                              ],
                            ),
                            Text(DateFormat('M/d/yy').format(postlist[index].createTime!)),
                          ],
                        ),
                        Text(postlist[index].content),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      //tweetボタンの実装
    );
  }
}