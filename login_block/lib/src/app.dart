import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart'
;

class App extends StatelessWidget {
  build(context){

    return Provider(
      key: UniqueKey(),
      child: MaterialApp(
      title: 'Login Me', 
      home: Scaffold(
      body: LoginScreen(),
      ),
    ),
    );
  }
}