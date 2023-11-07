import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/', arguments: '/third');
          },
        ),
      ),
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
                selected: false,
                title: const Text('First Screen'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/', arguments: "/second");
                }),
            ListTile(
                selected: false,
                title: const Text('Second Screen'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/second', arguments: "/second");
                }),
            ListTile(
                selected: true,
                title: const Text('Third Screen'),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data),
              ElevatedButton(
                onPressed: () {
                  // Return to the first screen.
                  Navigator.pushNamed(context, '/', arguments: "/second");
                },
                child: const Text('Go Back to First Screen'),
              ),
            ],
          )),
    );
  }
}
