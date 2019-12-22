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

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signUpUser(context, _name, _email, _password);
    }
    // logging in user w/ firebase
  }

  @override
  Widget build(BuildContext context) {
    final bool _isAndroid = (Theme.of(context).platform == TargetPlatform.android) ? true : false;


    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              children: <Widget>[
                Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            padding: EdgeInsets.only(top: 60.0,left: 10.0),
            icon: _isAndroid ? Icon(
              Icons.arrow_back,
              color: Colors.black,
            ) : Icon(Icons.arrow_back_ios),
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
                'Title',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 50.0,
                ),
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
                        decoration: InputDecoration(labelText: 'Name'),
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
                        decoration: InputDecoration(labelText: 'Email'),
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
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => (input.length < 8)
                            ? 'Password must be longer than 8 characters'
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
                        onPressed: () =>
                            _submit(),
                        color: Colors.red,
                        child: Text(
                          'Sign Up',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white),
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
