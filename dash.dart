import 'package:expense/widgets/Loginpage.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(36, 11, 54, 1.0),
                Color.fromRGBO(195, 11, 54, 1.0),
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: false,
                initialValue: 'Email',
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                autofocus: false,
                initialValue: 'PIN',
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed(Login.tag);
                },
                child: Text('Login'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
