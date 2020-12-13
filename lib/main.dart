import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/screens/SignUp.dart';
import 'package:food_shop/screens/home.dart';
import 'package:food_shop/screens/login.dart';
import 'package:food_shop/screens/product_detail.dart';
import 'package:provider/provider.dart';
import 'provider/my_provider.dart';
import 'screens/welcome_page.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Order',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFffcdd2),
          appBarTheme: AppBarTheme(
            color: Color(0xFFffcdd2)
          ),
          primarySwatch: Colors.deepOrange,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: ProductDetail(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
            builder: (index, snapshot){
                if(snapshot.hasData){
                  return HomePage();
                }
                return LoginPage();
        })
      ),
    );
  }
}


