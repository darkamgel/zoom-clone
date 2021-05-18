import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:videoconf/authentication/loginscreen.dart';
import 'package:videoconf/authentication/registerscreen.dart';
import 'package:videoconf/variables.dart';

class NavigateAuthScreen extends StatefulWidget {
  @override
  _NavigateAuthScreenState createState() => _NavigateAuthScreenState();
}

class _NavigateAuthScreenState extends State<NavigateAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          Container(
            width:MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: GradientColors.blue)
            ),
            child: Center(
              child: Image.asset('images/logo.png',height: 100,),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.6,
              margin: EdgeInsets.only(left: 30 , right:30),
              decoration: BoxDecoration(
                boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                     spreadRadius: 5,
                     blurRadius: 5,
                     offset: const Offset(0, 3),
                   )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap:()=>Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LoginScreen())),
                    child: Container(
                      width: MediaQuery.of(context).size.width /2,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors:GradientColors.beautifulGreen,
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("SIGN IN" ,style:mystyle(30,Colors.white) ,),
                      ),
                    ),
                  ),

                    SizedBox(height: 40,),

                  InkWell(
                    onTap:()=>Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>RegisterScreen())),

                    child: Container(
                      width: MediaQuery.of(context).size.width /2,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors:GradientColors.pink,
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("SIGN UP " ,style:mystyle(30,Colors.white) ,),
                      ),
                    ),
                  ),





                ],
              ),
            ),
          )
        ],

      ),
    );

  }
}
