import 'package:flutter/material.dart';
import 'package:hki_app/screen/formPengajuan/formPengajuan.dart';
import 'package:hki_app/screen/mainPage/mainPage.dart';
import 'package:hki_app/widget/contanta.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _UsernameController = TextEditingController();
  final _PasswordController = TextEditingController();
  @override
  void dispose() {
    _PasswordController.dispose();
    _UsernameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(left: 50, right: 50),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 30, bottom: 30),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assests/image/logo_A.png",
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 14),
                    ),
                    TextFormField(
                      controller: _UsernameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          // hintText: "Masukan Username",
                          hintStyle: TextStyle(fontSize: 14),
                          labelText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username tidak boleh kosong";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _PasswordController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          //hintText: "Masukan Password",
                          hintStyle: TextStyle(fontSize: 14),
                          labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password tidak boleh kosong";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              final isValidForm =
                                  formkey.currentState!.validate();
                              String usernmer = _UsernameController.text;
                              print(usernmer);
                              if (isValidForm) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()));
                              }
                            },
                            child: const Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
