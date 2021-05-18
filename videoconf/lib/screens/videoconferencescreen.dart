import 'package:flutter/material.dart';
import 'package:videoconf/variables.dart';
import 'package:videoconf/videoconference/createmeeting.dart';
import 'package:videoconf/videoconference/joinmeeting.dart';

class videoConferenceScreen extends StatefulWidget {
  @override
  _videoConferenceScreenState createState() => _videoConferenceScreenState();
}

class _videoConferenceScreenState extends State<videoConferenceScreen> with SingleTickerProviderStateMixin{
  TabController tabController;

  buildtab(String name){
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(name,style: mystyle(15,Colors.black,FontWeight.w700),),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text("GOOM",style: mystyle(20,Colors.white),),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            buildtab("Join Meeting"),
            buildtab("Create Meeting"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
        JoinMeeting(),
        CreateMeeting(),

      ],),
    );
  }
}
