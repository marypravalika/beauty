import 'package:beauty/email_configaration.dart';
import 'package:beauty/email_validation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/Logo.PNG"),
                fit: BoxFit.cover,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
                controller: _emailController,
                validator: (value) =>
                    !validateEmail(value) ? "Email is Invalid" : null,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                controller: _passwordController,
                validator: (value) => value.isEmpty
                    ? "Password is invalid"
                    : value.length < 9
                        ? "Password must contain at least 8 characters"
                        : null,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text("CREATE ACCOUNT"),
                  onPressed: () => _createAccountOnPressed(context),
                  color: Theme.of(context).primaryColor,
                  colorBrightness: Theme.of(context).primaryColorBrightness),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAccountOnPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // TODO: Implment sign-up process

    }
  }

  void _gotToEmailConfirmationScreen(BuildContext context, String email) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EmailConfirmationScreen(email: email),
      ),
    );
  }
}
