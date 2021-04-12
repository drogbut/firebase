
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';
import '../palette.dart';

class SignInPage extends StatelessWidget {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign in Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "E-mail"
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Password"
              ),
            ),
            SizedBox(height: 50,),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kBlue,
              ),
              child: FlatButton(
                onPressed: () {
                  /// call authentication service
                  context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  /*AuthenticationService(FirebaseAuth.instance).signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim()
                      );*/
                },
                child: Text(
                  "Sign In",
                  style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  void snack(String message, BuildContext context) {
    SnackBar snackBar = new SnackBar(
      content: new Text(
        message,
        style: TextStyle(fontSize: 20.0),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}

