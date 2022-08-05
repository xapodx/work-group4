import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool chek = false;
  TextEditingController _nameController = TextEditingController();
  String name = '';
  TextEditingController _passConroller = TextEditingController();
  String pass = '';
  TextEditingController _emailConroller = TextEditingController();
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SignUp',
          ),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: false,
                onChanged: (value) {
                  //name = value;
                },
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',

                  border: OutlineInputBorder(),
                  hintText: 'Enter your Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: false,
                onChanged: (value) {
                  //name = value;
                },
                controller: _emailConroller,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  //name = value;
                },
                controller: _passConroller,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 20,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Agree to terms and conditions'),
                // activeColor: Colors.red,
                value: chek,
                onChanged: (val) {
                  setState(() {
                    chek = val;
                  });
                },
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    validCheck(_nameController.text,_emailConroller.text,_passConroller.text);
                  },
                  child: Text(
                    'signUp',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'or signUp by',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    width: 135,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Google',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    width: 135,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'signUp',
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}



class validCheck {


  String UserName;
  String Password;
  String Email;

  validCheck(this.UserName,this.Email,this.Password);

  bool isNumeric(String str) {
    bool found = str.contains(new RegExp(r'[0-9]'));
    return found;
  }


  String ValidInput(){

    if(UserName.isEmpty){
      return "User Name is empty you should fill it";
    }
    if(Password.isEmpty){
      return "Password is empty you should fill it";
    }
    if(Email.isEmpty){
      return "Email is empty you should fill it";
    }
    if(isNumeric(UserName)){
      return "User Name must not contain any number!";
    }
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Email);
    if(!emailValid){
      return "Email form is not correct!";
    }
    return "success";
  }
}
