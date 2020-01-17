import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/mvvm/imp/view/home_page.dart';
import 'package:flutter_demo/view/home_page.dart' as prefix0;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = false;

  @override
  void initState() {
    super.initState();
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: new InputDecoration(
                      labelText: 'username',
                      hintText: 'username or email',
                      prefixIcon: Icon(Icons.person)),
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : 'username is empty';
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  autofocus: _nameAutoFocus,
                  decoration: new InputDecoration(
                      labelText: 'pwd',
                      hintText: 'pwd',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Icon(pwdShow
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              pwdShow = !pwdShow;
                            });
                          })),
                  obscureText: !pwdShow,
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : 'please input pwd';
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 55.0),
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return new prefix0.HomePage();
                        }));
                      },
                      textColor: Colors.white,
                      child: Text('loging'),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
