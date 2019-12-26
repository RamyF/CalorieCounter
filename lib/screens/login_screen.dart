import 'package:calorie_calculator/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:calorie_calculator/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePasswordTxt = true;
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.login(_email, _password);
      print('Done');
    }
    // logging in user w/ firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'LOGO',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 50.0,
                    color: Colors.white),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white)),
                        validator: (input) => !input.contains('@')
                            ? 'Please enter a valid email address'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            suffixIcon: (_obscurePasswordTxt)
                                ? FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscurePasswordTxt = false;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Icon(
                                        Icons.visibility_off,
                                      ),
                                    ),
                                  )
                                : FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscurePasswordTxt = true;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Icon(
                                        Icons.visibility,
                                      ),
                                    ),
                                  ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white)),
                        validator: (input) => (input.length < 8)
                            ? 'Password must be longer than 8 characters'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: _obscurePasswordTxt,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        padding: EdgeInsets.all(10.0),
                        onPressed: _submit,
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t Have an account?',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(10.0),
                          onPressed: () =>
                              Navigator.pushNamed(context, SignupScreen.id),
                          color: Colors.transparent,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
