import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({required Key super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true; 
  
    static Bloc? of(BuildContext context) {
      return  
      (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).bloc;
    }
  }