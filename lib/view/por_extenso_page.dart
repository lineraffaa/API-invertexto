import 'package:flutter/material.dart';
import 'package:flutter_application_app/service/invertexto_service.dart';

class PorExetnsoPage extends StatefulWidget {
  const PorExetnsoPage({super.key});

  @override
  State<PorExetnsoPage> createState() => _PorExetnsoPageState();
}

class _PorExetnsoPageState extends State<PorExetnsoPage> {
  String? campo;
  String? resultado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/invertexto.png',
              fit: BoxFit.contain,
              height: 48,
            )
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Digite",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: ((value) {
                setState(() {
                  campo = value;
                });
              }),
            ),
            Expanded(
              child: FutureBuilder(
                future: converteNumeroPorExtenso(campo),
                builder: ((context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:

                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return exibeResultado(context, snapshot);
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: snapshot.data["text"],
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
