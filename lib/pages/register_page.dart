import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 final _formKey = GlobalKey<FormState>(); 

  String _username,_password,_email;


  Widget _showTitle() {
    return Text('Register', style: Theme.of(context).textTheme.headline);
  }

  Widget _shoowUsernameInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (value)=>_username=value,
                validator: (val)=>val.length <6 ? 'Username to short':null,

        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
          hintText: 'Enter username, min length 6',
          icon: Icon(
            Icons.face,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _shoowEmailInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
         onSaved: (value)=>_email=value,
        validator: (val)=>!val.contains('@') ? 'Invalid Email':null,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'email',
          hintText: 'Enter username, min length 6',
          icon: Icon(
            Icons.face,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _shoowPasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
         onSaved: (value)=>_password=value,
                validator: (val)=>val.length <6 ? 'Password to short':null,

        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter password, min length 6',
          icon: Icon(
            Icons.face,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _showFormActions() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(
              'Submit',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
            ),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: _submit,
          ),
          FlatButton(
            child: Text('Existing user ? login'),
            onPressed: () {
              print('Login');
            },
          ),
        ],
      ),
    );
  }
void _submit(){
  //  if (_formKey.currentState.validate()  ) {
  //     print(_username);
  //           print(_email);
  //     print(_password);


  //  }else{
  //    print('invalid');
  //  }
  final form= _formKey.currentState;
  if (form.validate()) {
    form.save();
          print(_username);
            print(_email);
      print(_password);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _showTitle(),
                  //username
                  _shoowUsernameInput(),
                  //email
                  _shoowEmailInput(),
                  //password
                  _shoowPasswordInput(),
                  //button
                  _showFormActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
