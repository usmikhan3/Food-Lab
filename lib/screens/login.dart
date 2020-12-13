import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/widgets/heading_text.dart';
import 'package:food_shop/widgets/raised_btn.dart';
import 'package:food_shop/widgets/text_field.dart';
import 'package:food_shop/widgets/text_row.dart';

class LoginPage extends StatefulWidget {

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  UserCredential userCredential;
  bool loading = false;
  RegExp regExp = RegExp(LoginPage.pattern);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();


  Future getData() async{
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        globalKey
            .currentState
            .showSnackBar(
            SnackBar(
                content: Text("no user found for that email")
            )
        );
        return;
      } else if (e.code == 'wrong-password') {
        globalKey
            .currentState
            .showSnackBar(
            SnackBar(
                content: Text("Wrong password provided for that user")
            )
        );
        return;
      }
    }
  }


  void validation(){


    if(email.text.trim().isEmpty || email.text.trim() == null && password.text.trim().isEmpty || password.text.trim() == null || password.text.length <= 6){
      globalKey
          .currentState
          .showSnackBar(
          SnackBar(
              content: Text("Please fill all the fields")
          )
      );
      return;
    }

    if(email.text.trim().isEmpty || email.text.trim() == null){
      globalKey
          .currentState
          .showSnackBar(
          SnackBar(
              content: Text("Invalid email")
          )
      );
      return;
    }else if(!regExp.hasMatch(email.text)){
      globalKey
          .currentState
          .showSnackBar(
          SnackBar(
              content: Text("Invalid email")
          )
      );
      return;
    }

    if(password.text.trim().isEmpty || password.text.trim() == null || password.text.length <= 6){
      globalKey
          .currentState
          .showSnackBar(
          SnackBar(
              content: Text("password must be at least 6 characters")
          )
      );
      return;
    }
    else{
      setState(() {
        loading = true;
      });
      getData();
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.orangeAccent,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        leading: Icon(Icons.arrow_back_ios_outlined),
      ),


      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              MyHeadingText(text: "LOGIN", color: Colors.white, size: 40,),
            Column(
              children: [
                MyTextField(
                  controller: email,
                  hintText: "email",
                  textColor: Colors.white,
                  sideColor: Colors.white,
                  icon: Icons.face,
                  isObscureText: false, ),
                SizedBox(height:30,),
                MyTextField(
                  controller: password,
                  hintText: "Password",
                  textColor: Colors.white,
                  sideColor: Colors.white,
                  icon: Icons.vpn_key,
                  isObscureText: true, ),
              ],
            ),
            loading ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(backgroundColor: Colors.white,)
              ],
            )
                :MyRaisedBtn(
                name: "Login",
                textColor: Colors.black,
                color: Colors.white,
                onTap: (){
                  validation();
                },
            ),
            MyTextRow(text1: "New User?", text2: " Register")
          ],
        ),
      ),
    );
  }
}

