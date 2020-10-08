import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(),
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightGreenAccent,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        onPressed: () {
          Navigator.push(ctx, PageTwo());
        },
        child: Text("Go to page two"),
      )),
    );
  }
}

class PageTwo extends MaterialPageRoute<Null> {
  PageTwo()
      : super(builder: (BuildContext ctx) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(ctx).canvasColor,
              elevation: 1.0,
            ),
            body: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(ctx, PageThree());
                },
                child: Text("go to page three"),
              ),
            ),
          );
        });
}

class PageThree extends MaterialPageRoute<Null> {
  PageThree()
      : super(builder: (BuildContext ctx) {
          return Scaffold(
            appBar: AppBar(
              title: Text("last page"),
              backgroundColor: Theme.of(ctx).accentColor,
              elevation: 2.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                )
              ],
            ),
            body: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.popUntil(
                      ctx, ModalRoute.withName(Navigator.defaultRouteName));
                },
                child: Text("go home!"),
              ),
            ),
          );
        });
}
