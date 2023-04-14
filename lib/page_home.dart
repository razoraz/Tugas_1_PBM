import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Auth.isLogged
                ? Text(
                    'Username: ${Auth.email}\nPassword: ${Auth.password}',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                : const Text(
                    'You are not logged in.',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.center,
                  ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Auth.isLogged = false;
                  Navigator.pushNamed(context, '/login');
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text('Logout'),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Auth.isLogged = false;
                  Navigator.pushNamed(context, '/bmi');
                  // do something when the button is pressed
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text('BMI'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
