import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:videoconf/authentication/navigateauthscreen.dart';
import 'package:videoconf/variables.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        pages: [
          //first introduction page
          PageViewModel(
            title: "Welcome",
            body: "Welcome to GOOM , best video conference app ",
            image: Center(
              child: Image.asset('images/welcome.png',
              height: 175,),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20,Colors.black),
              titleTextStyle: mystyle(20,Colors.black)
            )
          ),


    //second introduction page
          PageViewModel(
              title: "Join or Start meetings",
              body: "Easy to use interface , join or start meetings in a fast time",
              image: Center(
                child: Image.asset('images/conference.png',
                  height: 175,),
              ),
              decoration: PageDecoration(
                  bodyTextStyle: mystyle(20,Colors.black),
                  titleTextStyle: mystyle(20,Colors.black)
              )
          ),


      //third introduction page
          PageViewModel(
              title: "Security",
              body: "Your security is important for us. Our servers are secure and reliable",
              image: Center(
                child: Image.asset('images/secure.jpg',
                  height: 175,),
              ),
              decoration: PageDecoration(
                  bodyTextStyle: mystyle(20,Colors.black),
                  titleTextStyle: mystyle(20,Colors.black)
              )
          ),
        ],
        onDone: (){
           Navigator.push(
               context,
               MaterialPageRoute(builder: (context)=>NavigateAuthScreen()));

        },
        onSkip: (){
          },
        showSkipButton:true ,
        skip: const Icon(Icons.skip_next,size:45),
        next: const Icon(Icons.arrow_forward_ios),
        done: Text("Done",style: mystyle(20,Colors.black),) ,

    );
  }
}
