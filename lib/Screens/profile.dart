
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanme/Components/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final double imageHeight = 160;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  radius: imageHeight / 2,
                  backgroundColor: Colors.grey.shade800,
                  backgroundImage: AssetImage("lib/Assets/Images/Tilan.jpg"),
                ),
              ),
              Text("About Me",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Text("👋 Hey there! I'm Tilan Neelaruwan, a passionate tech enthusiast with a BSc in Information & Communication Technology (Hons) with a specialization in software technologies. I'm your go-to expert when it comes to Flutter mobile application development.",
                style: TextStyle(fontSize: 18,height: 1.4),)),
                SizedBox(height: 20,),
                Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Text("🚀 With a knack for staying updated on the latest trends and technologies, I'm committed to delivering top-notch mobile experiences. Whether you're looking to build a cutting-edge app or need assistance with your Flutter project, I'm here to make it happen.",
                style: TextStyle(fontSize: 18,height: 1.4),)),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Center(child: Icon(FontAwesomeIcons.facebook,size: 32,),),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      child: Center(child: Icon(FontAwesomeIcons.linkedin,size: 32,),),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      child: Center(child: Icon(FontAwesomeIcons.instagram,size: 32,),),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}