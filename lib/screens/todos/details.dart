import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String title;

  const DetailsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailsScreen();
}

class _DetailsScreen extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: Text(widget.title),
      );
}
