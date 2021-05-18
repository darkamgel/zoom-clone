import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:videoconf/variables.dart';

class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController namecontroller = TextEditingController();
  bool isVideoMuted = true;
  bool isAudioMuted = true;
  TextEditingController roomcontroller = TextEditingController();
  String username = '';



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  getuserdata() async {
    DocumentSnapshot userdoc = await usercollection.doc(
        FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      username = userdoc.data()['username'];

    });
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "Room code",
              style: mystyle(20),
            ),
            SizedBox(
              height: 20,
            ),

            ///bigryo vane yeta x

            PinCodeTextField(
              controller: roomcontroller,
              appContext: context,
              length: 6,
              autoDisposeControllers: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(shape: PinCodeFieldShape.underline),
              animationDuration: Duration(milliseconds: 300),
              onChanged: (value) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: namecontroller,
              style: mystyle(20),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name (Leave if you want your username)",
                  labelStyle: mystyle(15)),
            ),
            SizedBox(
              height: 16,
            ),
            CheckboxListTile(
              value: isVideoMuted,
              onChanged: (value) {
                setState(() {
                  isVideoMuted = value;
                });
              },
              title: Text(
                "Video Muted",
                style: mystyle(18, Colors.black),
              ),
            ),

            SizedBox(
              height: 16,
            ),
            CheckboxListTile(
              value: isAudioMuted,
              onChanged: (value) {
                setState(() {
                  isAudioMuted = value;
                });
              },
              title: Text(
                "Audio Muted",
                style: mystyle(18, Colors.black),
              ),
            ),

            SizedBox(
              height: 16,

            ),

            Divider(
              height: 30,
              thickness: 2.0,
            ),

            Text("Of Course , you can Cutomize your settings in the meetings",
              style:mystyle(15) ,
                textAlign: TextAlign.center,),
            Divider(
              height: 48,
              thickness: 2.0,
            ),

            InkWell(
              onTap: ()=> joinmeeting(),
              child: Container(
                width: double.maxFinite,
                height: 64,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: GradientColors.facebookMessenger),
                ),
                child: Center(
                  child:Text("Join Meeting" , style: mystyle(20,Colors.white),),
                ),
              ),
            ),

          ],
        ),
      ),
    ));
  }

  joinmeeting() async{
    try{
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;

      if(Platform.isAndroid){
        featureFlag.callIntegrationEnabled = false;
      }else if (Platform.isIOS){
        featureFlag.pipEnabled = false;
      }

      var options = JitsiMeetingOptions()
      ..room = roomcontroller.text
      ..userDisplayName = namecontroller.text == '' ? username:namecontroller.text
      ..audioMuted = isAudioMuted
      ..videoMuted= isVideoMuted
        ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);


    }catch(e){
      print("we got error :$e");

    }


  }
}
