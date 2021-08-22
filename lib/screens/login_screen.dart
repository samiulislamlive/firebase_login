import 'package:flutter/material.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName= '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey();

  void _submit()
  {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          TextButton(onPressed: (){
            Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
          },
            child: Row(
            children: <Widget>[
              Text('SignUp'),
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
                    Colors.lightGreenAccent,
                    Colors.blue,
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
                height: 260, 
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
                          validator: (value)
                          {
                            if(value!.isEmpty || value.contains('@'))
                              {
                                return 'Invalid Email';
                              }
                            return null;
                          },
                          onSaved: (value)
                          {

                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value)
                          {
                            if(value!.isEmpty || value.length<=5)
                              {
                                return 'Invalid Password';
                              }
                            return null;
                          },
                          onSaved: (value){

                          }
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(onPressed: (){
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
