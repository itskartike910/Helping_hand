
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart'as http;

import '../main.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  String deviceToken="";
  Future<void> getDeviceTokenToSendNotification()async{
    final FirebaseMessaging _fcm=FirebaseMessaging.instance;
    final token=await _fcm.getToken();
    print("token=$token");
  }

  void showNotifications()async
  {
    var data={
      'to':'ey4rS0pXTxWrE-noWF2ITe:APA91bHxG9TVX_sc28xZPv1ceiqEJwJuSvV9yYtWBwiSSocnR9JW_Ldtxvw01jkiqIn0J8MDT7XrjZ8l-fG3MzJGa6PUknYm6KH8XJMlovivyVbtiL5VEF8MQmsp-0dJODLfcQ1vJrHX',
      'priority':'high',
      'notification':{
        'title':'akk notification title',
        'body':'body of kartik..',
      }
    };

    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body:jsonEncode(data),
        headers: {
          'Content-Type':'application/json; charset=UTF-8',
          'Authorization':'key=AAAA6TYmOT4:APA91bGYUOVvsOjT5L85oduaS82De-MNS49BFRdC8eI0cK4U995u7fmMdIBueNLjO2ioBF-X9Mh5DUqfMTJDKJWYIn6Mk-xXwwWKQs6LZKwhlYqzZNbnYLpvc6ND4DHXp1jO3t59SkbM',
        }
    );





    // AndroidNotificationDetails androidNotificationDetails=const AndroidNotificationDetails(
    //   "android_channel_id",
    //   "Anuj",
    //   priority: Priority.max,
    //   importance: Importance.max,
    //   playSound: true,
    //   enableLights: true,
    //   enableVibration: true,
    // );
    // NotificationDetails notificationDetails=NotificationDetails(android: androidNotificationDetails);
    // await notificationsPlugin.show(12345, "NotificationTitle",
    //   "this is body of notifications",
    //   notificationDetails,
    //   payload: "notifications payload",
    // );
  }








  void sendNotifications() async{
    var data={
      // 'to':'d_8B7MDcRkq2eV_ZFtF1zv:APA91bGncRjRp3KfPzmTq7DAvlu024qwh3_Cn_lqw33OxOgN5k7skbKO6Fwjj2y3OuxHiouG58LZkNRjEi_QyUHz5Y1yvNkFytn9dkVj0DB0Pd6z3gwnWOiXo8YeVoeCh02SRzKNOoq1',
      'to':'ey4rS0pXTxWrE-noWF2ITe:APA91bHxG9TVX_sc28xZPv1ceiqEJwJuSvV9yYtWBwiSSocnR9JW_Ldtxvw01jkiqIn0J8MDT7XrjZ8l-fG3MzJGa6PUknYm6KH8XJMlovivyVbtiL5VEF8MQmsp-0dJODLfcQ1vJrHX',
      // 'to':'eTDp1z86Q22L7ann0JYSli:APA91bFZuwxotuxiXF6cxxZiqG6LkY2jVyzyzFLlzDjuScUQxYka4q8mUdMBbA7nFDN31amTTeeEiQkziJQ0shqcpq4k-foM721AVaIeoCXZYS40tLfORvZsEsz09yFfL6GLqMlyLfRk',
      'priority':'high',
      'notification':{
        'title':'akk notification title',
        'body':'body of kartik..',
      }
    };
    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body:jsonEncode(data),
        headers: {
          'Content-Type':'application/json; charset=UTF-8',
          'Authorization':'key=AAAA6TYmOT4:APA91bGYUOVvsOjT5L85oduaS82De-MNS49BFRdC8eI0cK4U995u7fmMdIBueNLjO2ioBF-X9Mh5DUqfMTJDKJWYIn6Mk-xXwwWKQs6LZKwhlYqzZNbnYLpvc6ND4DHXp1jO3t59SkbM',
        }
    );
    print("message send");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        // sendPushNotification("aaa","Title","Body");
        getDeviceTokenToSendNotification();
        sendNotifications();
        // showNotifications();
        print("notification send");
      },
        child: const Icon(Icons.notifications_active_sharp),),
    );
  }
}




