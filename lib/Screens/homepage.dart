import 'package:flutter/material.dart';
import 'package:scanme/Components/colors.dart';
import 'package:scanme/Screens/firstTab.dart';
import 'package:scanme/Screens/profile.dart';
import 'package:scanme/Screens/secondTab.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

    Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }
    Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit from Scan Me?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {


    return  WillPopScope(
      onWillPop: (() => _onWillPop(context)),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
          backgroundColor: backgroundColor,
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.qr_code,
              size: 40,),
            ),
            Tab(
              icon: Icon(Icons.qr_code_scanner,
              size: 40,),
            ),
          ],
          ),
          title: Center(
            child:
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text("QR GENERATOR/SCANNER",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black)),
                     SizedBox(width: 20,),
                     InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Profile()));
                      },
                       child: CircleAvatar(
                               backgroundColor: Colors.grey.shade800,
                               backgroundImage: AssetImage("lib/Assets/Images/Tilan.jpg"),
                             ),
                     )
                   ],
                 ),
               ),
          ),
          body: TabBarView(
            children: [
              FirstTab(),
              SecondTab()
          ]),
        ),
      ),
    );
  }
}