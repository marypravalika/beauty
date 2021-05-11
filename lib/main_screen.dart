import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:beauty/UploadPicture.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Amplify.Auth.getCurrentUser(),
      builder: (BuildContext context, AsyncSnapshot<AuthUser> snapshot) {
        final currentUser = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("Main screen"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Upload Picture"),
                  onPressed: () => _uploadimageOnPreessed(context),
                  color: Colors.redAccent,
                ),
                RaisedButton(
                  child: Text("LOG IN"),
                  onPressed: () => _dashboards(context),
                  color: Colors.redAccent,
                ),
                Text("User ID ${currentUser?.userId}"),
                Text("User Name ${currentUser?.username}"),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _uploadimageOnPreessed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UploadPictureScreen(),
      ),
    );
  }

  Future<void> _dashboards(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UploadPictureScreen(),
      ),
    );
  }
}
