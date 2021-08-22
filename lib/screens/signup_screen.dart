import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';
import 'dart:core';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();
  Map<String, String> _authData = {
    'email': '',
    'password': ''
  };

  Future<void> _submit() async
  {
    if (!_formkey.currentState!.validate()) {
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Registration'),
          actions: <Widget>[
          TextButton(onPressed: (){
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    },

          child: Row(
        children: <Widget>[
          Text('Login'),
          Icon(Icons.person)
        ],
      ),
    )
    ],
      ),
          body: Stack(
            children: <Widget>[
              Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.limeAccent,
                      Colors.redAccent,
                    ]

                )
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || value.contains('@')) {
                              return 'Invalid Email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value!;
                          },
                        ),
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty || value.length <= 5) {
                                return 'Invalid Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            }
                        ),

                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value != _passwordController.text) {
                                return 'Invalid Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                            }
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(onPressed: () {
                          _submit();
                        },
                            child: Text(
                                'Submit'
                            ))


                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
