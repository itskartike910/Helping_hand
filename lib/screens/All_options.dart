import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertOptions extends StatefulWidget {
  const AlertOptions({Key? key}) : super(key: key);
  @override
  State<AlertOptions> createState() => _AlertOptionsState();
}
class _AlertOptionsState extends State<AlertOptions> {
  void call(String number)async
  {      final Uri url=Uri(
    scheme: 'tel',
    path: number,
  );
  if(await canLaunchUrl(url)){
    await launchUrl(url);
  }else{
    print("can not launch url");
  }
  }

  void showPhotoOptions(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("Send Alert message"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                Navigator.pop(context);
                const Text("Fire");
              },
              leading: const Icon(Icons.fireplace_outlined,color: Colors.red,),
              title: const Text("There is fire in house"),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                const Text("Theft");
                // selectImage(ImageSource.camera);
              },
              leading: const Icon(Icons.man,color: Colors.blue,),
              title: const Text("Theft has happened"),
            ),
          ],
        ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Column(
        children: [
          ListTile(
            onTap: (){
              call("100");
            },
            title: const Text("Police Number"),
            subtitle: const Text("100"),
            leading: const Icon(Icons.local_police,color: Colors.green,),
            trailing: const Icon(Icons.call,color: Colors.green,),
          ),
          ListTile(
            onTap: (){
              call("101");
            },
            trailing: const Icon(Icons.call,color: Colors.green,),
            title: const Text("Fire Brigade Number"),
            subtitle: const Text("101"),
            leading: const Icon(Icons.fireplace,color: Colors.red,),
          ),

          ListTile(
            onTap: (){
              call("102");
            },
            trailing: const Icon(Icons.call,color: Colors.green,),
            title: const Text("Ambulance Number"),
            subtitle: const Text("102"),
            leading: const Icon(Icons.account_balance_wallet_outlined,color: Colors.pinkAccent,),
          ),
          ListTile(
            onTap: (){
              call("108");
            },
            trailing: const Icon(Icons.call,color: Colors.green,),
            title: const Text("Disaster Number"),
            subtitle: const Text("108"),
            leading: const Icon(Icons.pages,color: Colors.green,),

          ),
          ListTile(
            onTap: (){
              call("1091");
            },
            trailing: const Icon(Icons.call,color: Colors.green,),
            title: const Text("Women Number"),
            subtitle: const Text("1091"),
            leading: const Icon(Icons.woman,color: Colors.pink,),

          ),
          ListTile(
            onTap: (){
              call("1073");
            },
            trailing: const Icon(Icons.call,color: Colors.green,),
            title: const Text("Road Accident Number"),
            subtitle: const Text("1073"),
            leading: const Icon(Icons.add_road,color: Colors.black,),
          ),
        ],
      ),


    );
  }
}

