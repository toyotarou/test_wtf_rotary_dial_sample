import 'package:flutter/material.dart';
import 'package:wtf_rotary_dial/wtf_rotary_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotary Dial Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RotaryDialScreen(),
    );
  }
}

class RotaryDialScreen extends StatefulWidget {
  const RotaryDialScreen({super.key});

  @override
  State<RotaryDialScreen> createState() => _RotaryDialScreenState();
}

class _RotaryDialScreenState extends State<RotaryDialScreen> {
  String phoneNumber = '';

  ///
  void _onDial(String number) {
    if (phoneNumber.length < 10) {
      setState(() => phoneNumber += number);
    }
  }

  ///
  void _resetDial() => setState(() => phoneNumber = '');

  ///
  void _backSpace() {
    if (phoneNumber.length > 1) {
      setState(() => phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1));
    }
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotary Dial Demo')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Phone Number: $phoneNumber', style: const TextStyle(fontSize: 24)),
            Transform.scale(
              scale: 0.4,
              child: RotaryDial(
                onDigitSelected: (int value) => _onDial(value.toString()),
                rotaryDialThemeData: RotaryDialThemeData(
                  spinnerColor: Colors.black,
                  rotaryDialColor: Colors.redAccent,
                  dialColor: Colors.purple,
                  numberColor: Colors.yellowAccent,
                ),
              ),
            ),
            ElevatedButton(onPressed: _resetDial, child: const Text('Reset')),
            ElevatedButton(onPressed: _backSpace, child: const Text('Back Space')),
          ],
        ),
      ),
    );
  }
}
