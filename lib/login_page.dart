import 'package:flutter/material.dart';
import 'register_page.dart';

class Auth {
  static bool isLogged = false;
  static String email = "";
  static String password = "";
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _isHovering = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _pesanError = '';
  String? username;
  String? password;
  String email = '';
  String passwordd = '';
  String _errorMessage = '';

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email == email && password == password) {
      Auth.isLogged = true;
      Auth.email = email;
      Auth.password = password;
      Navigator.pushNamed(context, '/home');
    } else {
      _showErrorDialog('Invalid email or password');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(children: <Widget>[
            Positioned(
              top: 20,
              left: 0,
              child: Image.asset(
                'assets/image/lantern 1.png', // gambar di pojok kiri atas
                width: 70,
                height: 70,
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: Image.asset(
                'assets/image/mosque 1.png', // gambar di pojok kanan atas
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/image/logo.png',
                width: 170,
                height: 170,
              ),
            ),
            SizedBox(height: 30), // memberikan jarak sebesar 30 pixel
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  autocorrect: false,
                  showCursor: true,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: Color(0xFF38753E),
                  ),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      size: 35,
                      color: Color(0xFF38753E),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF38753E),
                    ),
                    hintText: 'vramadhan@801gmail.com',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF38753E),
                        width: 4.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF38753E),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16), // memberikan jarak sebesar 16 pixel
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  autocorrect: false,
                  showCursor: true,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: Color(0xFF38753E),
                  ),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Masukan Password',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    icon: Icon(
                      Icons.lock,
                      size: 35,
                      color: Color(0xFF38753E),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF38753E),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF38753E),
                        width: 4.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF38753E),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(_pesanError),
            Stack(alignment: Alignment.bottomCenter, children: <Widget>[
              Positioned(
                bottom: 100,
                right: 80,
                left: 80,
                child: ElevatedButton(
                  onPressed: _login,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    minimumSize: Size(10, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 80,
                left: 80,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.red,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
