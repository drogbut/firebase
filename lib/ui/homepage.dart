
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';
import '../palette.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(child: Text("Homepage")),
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
                  context.read<AuthenticationService>().signOut();

                },
                child: Text(
                  "Sign up",
                  style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


}