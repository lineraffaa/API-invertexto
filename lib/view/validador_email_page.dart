import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_app/service/invertexto_service.dart';

class ValidadorEmailPage extends StatefulWidget {
  const ValidadorEmailPage({super.key});

  @override
  State<ValidadorEmailPage> createState() => _ValidadorEmailPageState();
}

class _ValidadorEmailPageState extends State<ValidadorEmailPage> {
  String email = ' ';
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
                labelText: "Digite o Email",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: ValidadorEmail(email),
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
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              labelText: (snapshot.data["email"]),
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder()),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: (snapshot.data["valid_format"]) ? "True" : "False",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder()),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: (snapshot.data["valid_mx"]) ? "True" : "False",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder()),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: (snapshot.data["disposable"]) ? "True" : "False",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder()),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
