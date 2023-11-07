import 'package:flutter/material.dart';

class GenerateScreen extends StatefulWidget{
  const GenerateScreen({super.key});

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  List<Widget> screens = [const PageWidget(1)]; // Initial screen
  int screenCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Navigation App'),
        leading: null,
      ),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Screen ${index + 1}'),
            onTap: () {
              // Navigate to the selected screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screens[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                screenCount++;
                screens.add(PageWidget(screenCount));
              });
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              if (screenCount > 1) {
                setState(() {
                  screenCount--;
                  screens.removeLast();
                });
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final int screenIndex;

  const PageWidget(this.screenIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen $screenIndex'),
      ),
      body: Center(
        child: Text('Screen $screenIndex'),
      ),
    );
  }
}

