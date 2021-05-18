import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:videoconf/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';


mailho() async {
  String username = 'username@gmail.com';
  String password = 'password';

  final smtpServer = gmail(username, password);


  // Create our message.
  final message = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add(getuserdatas)
    ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    final sendReport = await send(message, smtpServer);
    

    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}

String email = '';
bool dataisthere = false;

getuserdatas() async {
  DocumentSnapshot userdoc = await usercollection.doc(
      FirebaseAuth.instance.currentUser.uid).get();
    email = userdoc.data()['email'];
    dataisthere = true;

}

