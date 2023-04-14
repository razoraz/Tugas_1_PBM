import 'package:flutter/material.dart';
import 'page_home.dart'; // import halaman utama

class UserList {
  static List<User> _users = [];

  static void addUser(String email, String password) {
    final user = User(email, password);
    _users.add(user);
  }

  // tambahkan kode lain yang diperlukan di sini
}

class User {
  String email;
  String password;

  User(this.email, this.password);
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _errorMessage = '';

  void _register() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = 'Konfirmasi kata sandi tidak cocok';
      });
      return;
    }

    // Simpan data pengguna ke dalam list
    UserList.addUser(email, password);

    // Kembali ke halaman login
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(children: <Widget>[
            Positioned(
              top: 20,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: Image.asset(
                'assets/image/lantern 1.png', // gambar di pojok kanan atas
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/image/logo.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 70),
            // memberikan jarak sebesar 30 pixel
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      size: 35,
                      color: Color(0xFF38753E),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan email Anda';
                    } else if (!value.contains('@')) {
                      return 'Masukkan alamat email yang valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      size: 35,
                      color: Color(0xFF38753E),
                    ),
                    labelText: 'Kata Sandi',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan kata sandi Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_outline,
                      size: 35,
                      color: Color(0xFF38753E),
                    ),
                    labelText: 'Konfirmasi Kata Sandi',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi kata sandi Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _register();
                    }
                  },
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    minimumSize: Size(60, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
