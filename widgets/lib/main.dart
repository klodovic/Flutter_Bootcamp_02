import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<String> items = ['A', 'B', 'C', 'D', 'E', 'E', 'G', 'H', 'I', 'J', 'K'];

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List of Items')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: items[index],
            onDelete: () => deleteItem(index),
          );
        },
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  final String item;
  final VoidCallback onDelete;

  const ItemWidget({super.key, required this.item, required this.onDelete});
  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = getRandomColor();
  }

  Color getRandomColor() {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple
    ];
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: backgroundColor,
      title: Text(widget.item),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: widget.onDelete,
      ),
    );
  }
}
