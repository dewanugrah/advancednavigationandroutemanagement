import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Navigation'),
            ),
            ListTile(
                selected: true,
                title: const Text('First Screen'),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                selected: false,
                title: const Text('Second Screen'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/second', arguments: "/first");
                }),
            ListTile(
                selected: false,
                title: const Text('Third Screen'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/third', arguments: "/first");
                }),
          ],
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second screen.
                  Navigator.pushNamed(context, '/second', arguments: '/first');
                },
                child: const Text('Go to Second Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second screen.
                  Navigator.pushNamed(context, '/third', arguments: '/first');
                },
                child: const Text('Go to Third Screen'),
              ),
            ],
          )),
    );
  }
}
