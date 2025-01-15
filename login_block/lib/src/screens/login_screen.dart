import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:40.0),
          ),
          Text(
            'Login',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),),
          emailField(bloc!),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top:20.0),
            
          ),
          submitButton(bloc),
        ],),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email, 
      builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changeEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@gmail.com',
        labelText: 'Email Address',
        errorText: snapshot.error?.toString(),
      ),
    );
    },);

  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password, 
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          errorText: snapshot.error?.toString(),
      ),
    );


      }
      
      );

    
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(stream: bloc.submitValid,
     builder: (context, snapshot) {
        bool isValid = snapshot.hasError ? false : 
        snapshot.data ?? false;
        return ElevatedButton(
        child: Text('login'),
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(50.0, 50.0)),
        backgroundColor: WidgetStatePropertyAll(
          isValid ? Colors.blue : Colors.grey),
        ),
      onPressed: snapshot.hasData ?  bloc.submit
      
      : null,

    ); 
     },
     
     );

    
  }
}