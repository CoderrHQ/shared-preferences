import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/counter_button.dart';
import '/counter_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  @override
  void initState() {
    _loadCounter();
    super.initState();
  }

  Future _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  Future<void> _increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter++;
    await prefs.setInt('counter', _counter);
    setState(() {});
  }

  Future<void> _decrement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter--;
    await prefs.setInt('counter', _counter);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // responsible for displaying counter
            CounterWidget(
              value: _counter,
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButton(
                  onPressed: _decrement,
                  icon: Icons.remove,
                ),
                const SizedBox(width: 50),
                CounterButton(
                  onPressed: _increment,
                  icon: Icons.add,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
