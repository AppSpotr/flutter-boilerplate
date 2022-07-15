import 'package:boilerplate/screens/counter/widget.dart';
import 'package:boilerplate/screens/counter2/widget.dart';
import 'package:boilerplate/state/navigation/actions.dart';
import 'package:boilerplate/state/navigation/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<Widget> pages = <Widget>[
  CounterPage(
    title: 'Counter Page 1',
  ),
  Counter2Page(),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late NavigationActions navActions = NavigationActions(context: context);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Consumer<NavigationState>(
      builder: (context, navigation, child) => Scaffold(
        body: IndexedStack(
          index: navigation.selectedIndex,
          children: pages,
        ),
        // Consumer gives access to state
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigation.selectedIndex,
          onTap: navActions.selectBottomBarRoute,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'home2',
            ),
          ],
        ),
      ),
    );
  }
}
