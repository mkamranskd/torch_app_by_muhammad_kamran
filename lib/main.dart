import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Torch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),

    );
  }
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final controller = TorchController();
  bool isTorchOn = false;

  void toggleTorch() async {
    await controller.toggle(intensity: 1);
    bool? torchStatus = await controller.isTorchActive;
    setState(() {
      isTorchOn = torchStatus ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue[900], // Dark blue color

        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: const TextTheme(
        ),
        appBarTheme: AppBarTheme(
          color: Colors.blue[900],

        ),
      ),
      home: GestureDetector(
        onTap: toggleTorch,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Torch App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lightbulb,
                  color: isTorchOn ? Colors.yellow : Colors.white,
                  size: 300,
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: toggleTorch,
                  color: isTorchOn ? Colors.yellow : Colors.white,
                  child: const Column(
                    children: [
                      Text('Toggle', style: TextStyle(color: Colors.black),),
                    ],
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
