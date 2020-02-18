import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(VerifiedApp());

class VerifiedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Verified',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]); //Hide at the end
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              ScaleRoute(page: HomeScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: DecoratedBox(
      decoration: new BoxDecoration(
        color: Colors.black,
        image: new DecorationImage(
            image: new AssetImage('images/splash.jpeg'), fit: BoxFit.fill),
      ),
    ));
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(transitionDuration: Duration(milliseconds: 350),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
          FadeTransition(
                opacity: animation,
                child: child),
        );
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
            child: Text("HELLO!",
                style: TextStyle(color: Colors.black, fontSize: 40))));
  }
}
