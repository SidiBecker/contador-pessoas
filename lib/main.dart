import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(
    MaterialApp(
      title: "Contador de Pessoas",
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar!";
  bool _buttonUpDisabled = false;
  bool _buttonDownDisabled = true;

  void _refresh(int delta) {
    setState(() {
      _people += delta;
      debugPrint("People: $_people");

      if (_people == 0) {
        _buttonDownDisabled = true;
      } else if (_people <= 10) {
        _infoText = "Pode entrar!";
        _buttonDownDisabled = false;
        _buttonUpDisabled = false;
      } else {
        _infoText = "Lotado!";
        _buttonUpDisabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/restaurant.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 2.0),
                child: Container(
                  color: Colors.blueAccent.withOpacity(0.2),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pessoas: $_people",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45.0,
                      shadows: <Shadow>[
                        Shadow(
                            color: Colors.black,
                            offset: Offset.fromDirection(6, 2)),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: !_buttonUpDisabled,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Text(
                            "+1",
                            style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset.fromDirection(6, 2)),
                                ]),
                          ),
                          disabledColor: Colors.grey,
                          onPressed: _buttonUpDisabled
                              ? null
                              : () {
                                  _refresh(1);
                                },
                        ),
                      ),
                    ),
                    Visibility(
                        visible: !_buttonDownDisabled,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FlatButton(
                            child: Text(
                              "-1",
                              style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset.fromDirection(6, 2)),
                                  ]),
                            ),
                            disabledColor: Colors.grey,
                            onPressed: _buttonDownDisabled
                                ? null
                                : () {
                                    _refresh(-1);
                                  },
                          ),
                        )),
                  ],
                ),
                Text(
                  _infoText,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0,
                      shadows: <Shadow>[
                        Shadow(
                            color: Colors.black,
                            offset: Offset.fromDirection(6, 2)),
                      ]),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text("Desenvolvido por Sidnei Luiz Becker",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  shadows: <Shadow>[
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset.fromDirection(6, 2)),
                                  ])),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text("github.com/SidiBecker",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  shadows: <Shadow>[
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset.fromDirection(6, 2)),
                                  ])),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
