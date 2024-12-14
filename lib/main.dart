import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatelessWidget {
  const MyTabbedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Custom Page'),
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyCustomPage(),
            AnotherPage(),
          ],
        ),
      ),
    );
  }
}

class MyCustomPage extends StatelessWidget {
  const MyCustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const AnimatedText(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnotherPage(),
                  ),
                );
              },
              child: const Text('Go to Another Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[100],
      child: const Center(
        child: Text(
          'This is Another Page!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  final List<String> _messages = [
    'Welcome to My Custom Page!',
    'Nice to meet you',
    'My name is Sarita Monthonpunyakun !',
  ];
  int _index = 0;

  void _changeMessage() {
    setState(() {
      _index = (_index + 1) % _messages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _messages[_index],
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _changeMessage,
          child: const Text('Change Message'),
        ),
      ],
    );
  }
}
