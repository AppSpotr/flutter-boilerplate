import 'package:boilerplate/state/counter/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterActions {
  final BuildContext context;
  late CounterState counter;

  CounterActions({required this.context}) {
    counter = Provider.of<CounterState>(context, listen: false);
  }

  void increment() {
    counter.counter++;
    counter.update();
  }
}
