import 'package:calorie_calculator/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;
  final _passwordController = TextEditingController();

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signUpUser(context, _name, _email, _password);
    }
    // logging in user w/ firebase
  }


  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final bool _isAndroid =
        (Theme.of(context).platform == TargetPlatform.android) ? true : false;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: EdgeInsets.only(top: 60.0, left: 10.0),
                  icon: _isAndroid
                      ? Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(
                height: 75.0,
              ),
              Center(
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
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Colors.white)),
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please enter a name'
                                  : null,
                              onSaved: (input) => _name = input,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
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
                              controller: _passwordController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (input) => (input.length < 8)
                                  ? 'Password must be longer than 8 characters'
                                  : null,
                              onSaved: (input) => _password = input,
                              obscureText: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (input) =>
                                  (input.toString() != _passwordController.text)
                                      ? 'Passwords don\'t match'
                                      : null,
                              onSaved: (input) => _password = input,
                              obscureText: true,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            width: 250.0,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              padding: EdgeInsets.all(10.0),
                              onPressed: () => _submit(),
                              color: Colors.white,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
