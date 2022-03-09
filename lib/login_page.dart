import 'package:ex_mobile/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/default.jpg"),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ],
          ),
    ));
  }

  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
            labelText: "Username",
            hintText: "Input Username",
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
            )),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
            labelText: "Password",
            hintText: "Input Password",
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
            )),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: (isLoginSuccess) ? Colors.blue : Colors.red,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            String status = "";
            if (password == "123") {
              setState(() {
                status = "Login Success";
                isLoginSuccess = true;
              });

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return HomePage(username: username);
              }));

            } else {
              setState(() {
                status = "Login Failed";
                isLoginSuccess = false;
              });
            }

            SnackBar snackBar = SnackBar(content: Text(status));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text("Login")),
    );
  }
}
