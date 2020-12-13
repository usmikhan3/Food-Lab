import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/widgets/heading_text.dart';
import 'package:food_shop/widgets/raised_btn.dart';
import 'package:food_shop/widgets/text_field.dart';
import 'package:food_shop/widgets/text_row.dart';

class RegisterPage extends StatefulWidget {

static Pattern pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}



class _RegisterPageState extends State<RegisterPage> {

  bool loading = false;
  UserCredential userCredential;
  RegExp regExp = RegExp(RegisterPage.pattern);
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();


  Future sendData() async{
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
      await FirebaseFirestore.instance.collection("userData").doc(userCredential.user.uid).set({
        'userId':userCredential.user.uid,
        'firstName': firstName.text,
        'lastName': lastName.text,
        'email': email.text,
        'password': password.text,

      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey
            .currentState
            .showSnackBar(
            SnackBar(
                content: Text("Password is Weak")
            )
        );
      } else if (e.code == 'email-already-in-use') {
        globalKey
            .currentState
            .showSnackBar(
            SnackBar(
                content: Text("The account already exists for that email")
            )
        );
      }
    } catch (e) {
      globalKey
          .currentState
          .showSnackBar(
          SnackBar(
              content: Text(e)
          )
      );
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });

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

    if(firstName.text.trim().isEmpty || firstName.text.trim() == null){
      globalKey
          .currentState
          .showSnackBar(
          SnackBar(
              content: Text("Invalid first name")
          )
      );
          return;
    }

    if(lastName.text.trim().isEmpty || lastName.text.trim() == null){
      globalKey
          .currentState
          .showSnackBar(
          SnackBar(
              content: Text("Invalid last name")
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
      sendData();
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
            MyHeadingText(text: "SIGN UP", color: Colors.white, size: 40,),
            Column(
              children: [
                MyTextField(
                    controller: firstName,
                    hintText: "First Name",
                    textColor: Colors.white,
                    sideColor: Colors.white,
                    icon: Icons.person,
                    isObscureText: false),
                SizedBox(height:30 ,),
                MyTextField(
                    controller: lastName,
                    hintText: "Last Name",
                    textColor: Colors.white,
                    sideColor: Colors.white,
                    icon: Icons.face,
                    isObscureText: false ),
                SizedBox(height:30 ,),
                MyTextField(
                    controller: email,
                    hintText: "Email",
                    textColor: Colors.white,
                    sideColor: Colors.white,
                    icon: Icons.email,
                    isObscureText: false ),
                SizedBox(height:30 ,),
                MyTextField(
                    controller: password,
                    hintText: "Password",
                    textColor: Colors.white,
                    sideColor: Colors.white,
                    icon: Icons.vpn_key,
                    isObscureText: true),


              ],
            ),
            loading ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(backgroundColor: Colors.white,)
              ],
            ) : MyRaisedBtn(
                name: "Register",
                textColor: Colors.black,
                color: Colors.white,
                onTap: (){
                  validation();
                },

            ),
            MyTextRow(text1: "Already A user?", text2: " Login")
          ],
        ),
      ),
    );
  }
}

