import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int angkaindex = 0;
  double _tinggi = 160;
  double _berat = 60;
  bool _isMale = true;
  double _bmi = 0;

  void _calculateBMI() {
    double heightInMeter = _tinggi / 100;
    double bmi = _berat / (heightInMeter * heightInMeter);
    setState(() {
      _bmi = bmi;
    });
  }

  String _getBMICategory() {
    if (_bmi < 18.5) {
      return 'Kurus';
    } else if (_bmi < 25) {
      return 'Normal';
    } else if (_bmi < 30) {
      return 'Gendut';
    } else {
      return 'Obesitas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Color(0xfffafafa),
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.settings_accessibility,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                // aksi yang ingin dilakukan ketika tombol kanan ditekan
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                // aksi yang ingin dilakukan ketika tombol kiri ditekan
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isMale = true;
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: _isMale ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Man',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isMale = false;
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: _isMale ? Colors.grey : Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Woman',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Height',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${_tinggi.toInt()} cm',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Slider(
                  value: _tinggi,
                  min: 100,
                  max: 220,
                  onChanged: (value) {
                    setState(() {
                      _tinggi = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weight',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${_berat.toInt()} kg',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          _berat--;
                        });
                      },
                      heroTag: 'btn1',
                      mini: true,
                      backgroundColor: Colors.grey[400],
                      child: Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          _berat++;
                        });
                      },
                      heroTag: 'btn2',
                      mini: true,
                      backgroundColor: Colors.blue[400],
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _calculateBMI();
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 300,
                            color: Color(0xff757575),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xfffafafa),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Hasil BMI KAMU',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _getBMICategory(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Text(
                                      _bmi.toStringAsFixed(2),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 64,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 1, 96, 30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(
                    'Hitung',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
