
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_firebase/ui/homepage.dart';
import 'package:flutter_login_firebase/ui/sign_in_page.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// (1) Create the initialization Future outside of `build`:
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  /*MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;*/

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges),
      ],
      child: FutureBuilder(
      /// (3) Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        /// (3.1) Check for errors
        if (snapshot.hasError) {
          return new Container(
            color: Colors.red,
          );
        }
        /// (3.2) Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Firebase',
            theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: AuthenticationWrapper(),
          );
        }
        /// (3.3) Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    ),
    );


  }

}

class AuthenticationWrapper extends StatelessWidget {


  AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return HomePage();
    }else{
      return SignInPage();
    }

  }



 /* @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  // Two way to solve snackbar problem
  // (1) Using Builder widget
  // (2) Using GlobalKey ... the can be pass to other custom widgets class that do not contain any scaffold.
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextInputField(
              icon: Icons.mail,
              hint: 'Email',
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
            ),
            PasswordInput(
              icon: Icons.lock,
              hint: 'Password',
              inputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kBlue,
              ),
              child: FlatButton(
                onPressed: () {
                  signIn(_email, _password);
                },
                child: Text(
                  "Login",
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


  Future<UserCredential> signIn(String email, String password) async {
    UserCredential user;
    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      return user;
      //assert(user != null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snack("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        snack("Wrong password provided for that user.", context);
      }
      throw e;
    }
    return user;
  }

  void snack(String message, BuildContext context) {
    SnackBar snackBar = new SnackBar(
      content: new Text(
        message,
        style: TextStyle(fontSize: 20.0),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }*/
}
