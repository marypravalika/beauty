import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:beauty/amplifyconfiguration.dart';
import 'package:beauty/login_screen.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(MyApp());
}

Future<void> configureAmplify() async {
  Amplify.addPlugins([AmplifyAuthCognito()]);
  try {
    Amplify.configure(amplifyconfig);
  } catch (e) {
    print("configured");
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _AmplifyState createState() => _AmplifyState();
}

class _AmplifyState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
